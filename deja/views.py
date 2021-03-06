from django.contrib.auth import logout, login, authenticate
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse, HttpResponseRedirect, Http404
from django.shortcuts import get_object_or_404, render
from django.urls import reverse
from django.template import RequestContext
from django.contrib import messages
from deja.forms import *
from deja.models import *
import pyrebase
from deja.api.sightengine import get_celebs
import imdb
from imdb.Person import Person
from heapq import nlargest

# -----Firebase key and integration of pyrebase----- #

config = {
    "apiKey": "AIzaSyAAw5FV9aw2OJBCMwLV8TVIJemk0dTQR38",
    "authDomain": "dejaview-d81e4.firebaseapp.com",
    "databaseURL": "https://dejaview-d81e4.firebaseio.com",
    "projectId": "dejaview-d81e4",
    "storageBucket": "dejaview-d81e4.appspot.com",
    "messagingSenderId": "39327407953"
}

firebase = pyrebase.initialize_app(config)

# ---------- #

# -----VIEWS----- #


def index(request):
    '''View for landing page'''
    return render(request, "index.html")


def register_user(request):
    '''Handles the creation of a new user for authentication'''

    # A boolean value for telling the template whether the registration was successful.
    # Set to False initially. Code changes value to True when registration succeeds.
    registered = False

    # Create a new user by invoking the `create_user` helper method on Django"s built-in User model
    if request.method == "POST":
        user_form = UserForm(data=request.POST)

        if user_form.is_valid():
            # Save the user's form data to the database.
            user = user_form.save()

            # Collect password with the set_password helper method.
            user.set_password(user.password)
            # Once hashed, update the user object.
            user.save()

            # Update variable to tell the template registration was successful.
            registered = True

        return login_user(request)

    # Load registration form
    elif request.method == "GET":
        user_form = UserForm()
        register_template = "register.html"
        return render(request, register_template, {"user_form": user_form})


def login_user(request):
    '''Handles the login of a registered user for authentication'''

    # Obtain the context for the user's request.
    context = {"next": request.GET.get("next", "/")}

    # If the request is a HTTP POST, try to pull out the relevant information.
    if request.method == "POST":

        # Use the built-in authenticate method to verify
        username = request.POST["username"]
        password = request.POST["password"]
        authenticated_user = authenticate(username=username, password=password)

        # If authentication was successful, log the user in
        if authenticated_user is not None:
            login(request=request, user=authenticated_user)
            if request.POST.get("next") == "/":
                return HttpResponseRedirect("/")
            else:
                print("ELSE STATEMENT:", request.POST.get("next", "/"))
                return HttpResponseRedirect(request.POST.get("next", "/"))

        else:
            # Bad login details were provided. User cannot be logged in
            print("Invalid login details: {}, {}".format(username, password))

    return render(request, "login.html", context)


@login_required
def logout_user(request):
    logout(request)

    # Take the user back to the homepage.
    return HttpResponseRedirect("/")


@login_required
def deja(request):
    ''' View for user to create a Deja '''

    # Creates an instance of a Deja in database upon clicking "Deja"
    if request.method == 'POST':
        current_user = request.user

        img_url = request.POST["url"]
        user = User.objects.get(pk=current_user.id)

        new_deja = Deja(img_url=img_url, user=user)
        new_deja.save()

        return HttpResponseRedirect(reverse('deja:deja_results', args=(new_deja.id,)))

    return render(request, "deja.html")


@login_required
def deja_results(request, deja_id):
    ''' View for celeb matches and that performer's most recent projects '''

    # ----- FACIAL RECOGNITION -----

    # Stores the Firebase url of the most recently uploaded image
    uploaded_img = Deja.objects.get(pk=deja_id).img_url
    # Submits url to Sight Engine API and returns top five possible matches
    results = get_celebs(uploaded_img)

    # ----------

    # Saves top match to Results table
    if results:
        try:
            # Checks if result has already been saved
            top_match = Result.objects.get(deja=deja_id)
        except:
            # If no instance, create top match entry in Results
            deja = Deja.objects.get(pk=deja_id)
            name = results[0]['name']
            probability = results[0]['prob']

            new_result = Result(deja=deja, name=name, probability=probability)
            new_result.save()

    # Handles all possible posts on deja_results page
    if request.method == 'POST':

        # If user clicks on a celebrity match, they will be presented with the celeb and their 5 most recent credits
        if request.POST.get('celeb_name'):
            celeb_name = request.POST['celeb_name']

            # Most recent filmography load is saved in session storage for faster recall

            # Checks if a filmography load for the clicked celeb exists in session storage
            if request.session.get('credits') and request.session['credits']['celeb_name'] == celeb_name:
                return render(request, "films.html", request.session['credits'])
            else:
                # IMDPy fetch for result's filmography
                ia = imdb.IMDb()
                celeb = ia.search_person(celeb_name)
                celebID = celeb[0].personID
                person = ia.get_person(celebID)
                filmography = person['filmography']

                # List of  5 most recent entries to pass to template
                most_recent = []

                # Loop through films and run logic before adding them to most_recent
                for value in filmography[0].values():
                    for film in value:
                        if len(most_recent) < 5:
                            # print(dir(film))
                            movieID = film.getID()
                            movie = ia.get_movie(movieID)
                            film_title = film['title']

                            # Only grabs movies with user rating votes to help filter out upcoming projects
                            if movie.get('votes'):
                                # Trims () that appears at the ends of upcoming projects
                                if film_title.endswith("()"):
                                    film_title = film_title[:-3]

                                # Create unique URL to add to film titles on filmography and watchlist pages
                                link = "http://www.imdb.com/title/tt" + movieID + "/"

                                # Dictionary of credit info
                                credit = {'link': link, 'title': film_title}

                                # Dictionary is added to most_recent list
                                most_recent.append(credit)

                # Returns URL of actor headshot OR default message if none available
                no_headshot = "No headshot available"
                headshot = person.get('full-size headshot', no_headshot)

                context = {'headshot': headshot, 'most_recent': most_recent, 'celeb_name': celeb_name, 'celebID': celebID}

                # Saves context to session storage for faster load if match is clicked consecutively. NOTE: Clicking on a different match replaces the session storage context.
                request.session['credits'] = context

                return render(request, "films.html", request.session['credits'])

        # If user clicks pen button, loads note page
        elif request.POST.get("note"):
            return HttpResponseRedirect(reverse("deja:note", args=(deja_id,)))

        # If user clicks trash button, deletes current deja
        elif request.POST.get('delete'):
            deja_id = request.POST['delete']
            deja = Deja.objects.get(pk=deja_id)
            deja.delete()
            messages.info(request, "Deja Deleted")
            return HttpResponseRedirect(reverse("deja:index"))

        #----- FILMS.HTML POSTS -----#

        # Takes user back to match results
        elif request.POST.get('back'):
            return HttpResponseRedirect(reverse("deja:deja_results", args=(deja_id,)))

        # Adds title to user's dejaQueue
        elif request.POST.get('watchlist_add'):
            current_user = request.user

            # If a credit has been checked, it is added to the database
            if 'credit' in request.POST:
                watch_titles = request.POST.getlist('credit')
                # Grabs urls from hidden input
                watch_links = request.POST.getlist('link')
                credit = dict(zip(watch_titles, watch_links))
                saved = False

                for name, url in credit.items():
                    # checks if title already exists on watchlist, if so, it is not added.
                    try:
                        title = Queue.objects.get(title=name)
                        messages.warning(request, f"{name} is already in your Queue")
                    except:
                        title = name
                        link = url
                        user_id = current_user.id

                        queue_item = Queue(title=title, link=link, user_id=user_id)
                        queue_item.save()
                        saved = True
                if saved == True:
                    messages.info(request, "dejaQueue Updated")
            else:
                # Feedback if button is clicked without any selections
                messages.warning(request, "Please select a title")
            return render(request, "films.html", request.session['credits'])

    else:

        return render(request, "deja_results.html", {'results': results, 'uploaded_img': uploaded_img, 'deja_id': deja_id})


@login_required
def note(request, deja_id):
    '''View to create or edit a note attached to a Deja'''

    # Call to database to see if a note is already attached to the current Deja
    note = Note.objects.filter(deja_id=deja_id).exists()

    if note:
        # If note exists, grab the note object
        note = Note.objects.get(deja_id=deja_id)
        # Grab the note text
        current_note = {'text': note.text}
        # Pre-populate the Note Form with the current note's text
        note_form = NoteForm(initial=current_note)

        # When the user clicks save
        if request.method == 'POST':
            # Grab the updated text & save it
            note.text = request.POST['text']
            note.save()

            # Create confirmation note for user
            messages.info(request, "Note Updated")
            return HttpResponseRedirect(reverse("deja:deja_results", args=(deja_id,)))

    else:
        # Load the empty Note Form
        note_form = NoteForm()

        # When the user clicks save
        if request.method == 'POST':
            # Grab the note's text & save it to the corresponding Deja
            text = request.POST['text']
            deja = Deja.objects.get(pk=deja_id)
            new_note = Note(text=text, deja=deja)
            new_note.save()

            # Create confirmation note for user
            messages.info(request, "Note Saved")
            return HttpResponseRedirect(reverse("deja:deja_results", args=(deja_id,)))

    return render(request, "note.html", {'note_form': note_form})


@login_required
def history(request):
    '''View of a user's created Dejas'''
    current_user = request.user
    # Grabs all dejas created by the current user
    dejas = Deja.objects.filter(user_id=current_user.id).order_by('-id')

    if request.method == 'POST':
        # Pulls the clicked deja's id to pass to deja_results view
        if request.POST.get('deja'):
            deja_id = request.POST['deja']
            return HttpResponseRedirect(reverse("deja:deja_results", args=(deja_id,)))
        # Deletes the attached deja
        elif request.POST.get('delete'):
            deja_id = request.POST['delete']
            deja = Deja.objects.get(pk=deja_id)
            deja.delete()
            messages.info(request, "Deja Deleted")
            return HttpResponseRedirect(reverse('deja:history'))

    return render(request, "history.html", {'dejas': dejas})


@login_required
def watchlist(request):
    current_user = request.user

    # Sorts watchlist into two categories for template
    to_watch = Queue.objects.filter(user_id=current_user.id, watched=False)
    watched = Queue.objects.filter(user_id=current_user.id, watched=True)

    if request.method == 'POST':
        # Delete a title from the queue
        if request.POST.get('remove'):
            watchlist_id = request.POST['remove']
            watchlist_item = Queue.objects.get(pk=watchlist_id)
            watchlist_item.delete()
            messages.info(request, "Queue Updated")
            return HttpResponseRedirect(reverse('deja:watchlist'))

        # Mark a title as not yet watched
        elif request.POST.get('watch'):
            watchlist_id = request.POST['watch']
            watchlist_item = Queue.objects.get(pk=watchlist_id)
            watchlist_item.watched = False
            watchlist_item.save()
            messages.info(request, "Queue Updated")
            return HttpResponseRedirect(reverse('deja:watchlist'))

        # Mark a title as watched
        elif request.POST.get('watched'):
            watchlist_id = request.POST['watched']
            watchlist_item = Queue.objects.get(pk=watchlist_id)
            watchlist_item.watched = True
            watchlist_item.save()
            messages.info(request, "Queue Updated")
            return HttpResponseRedirect(reverse('deja:watchlist'))

    return render(request, "watchlist.html", {'to_watch': to_watch, 'watched': watched})
