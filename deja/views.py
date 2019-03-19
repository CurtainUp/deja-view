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

config = {
    "apiKey": "AIzaSyAAw5FV9aw2OJBCMwLV8TVIJemk0dTQR38",
    "authDomain": "dejaview-d81e4.firebaseapp.com",
    "databaseURL": "https://dejaview-d81e4.firebaseio.com",
    "projectId": "dejaview-d81e4",
    "storageBucket": "dejaview-d81e4.appspot.com",
    "messagingSenderId": "39327407953"
}

firebase = pyrebase.initialize_app(config)

# Create your views here.
def index(request):
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
            # Save the user"s form data to the database.
            user = user_form.save()

            # Now we has the password with the set_password helper method.
            # Once hashed, we can update the user object.
            user.set_password(user.password)
            user.save()

            # Update our variable to tell the template registration was successful.
            registered = True

        return login_user(request)

    elif request.method == "GET":
        user_form = UserForm()
        register_template = "register.html"
        return render(request, register_template, {"user_form": user_form})

def login_user(request):
    '''Handles the login of a registered user for authentication'''

    # Obtain the context for the user"s request.
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

# Use the login_required() decorator to ensure only those logged in can access the view.
@login_required
def logout_user(request):
    # Since we know the user is logged in, we can now just log them out.
    logout(request)

    # Take the user back to the homepage.
    return HttpResponseRedirect("/")

@login_required
def deja(request):
    ''' View for user to create a Deja '''

    # Creates an instance of a Deja in database upon clicking "Deja"
    current_user = request.user

    if request.method == 'POST':
        img_url = request.POST["url"]
        user = User.objects.get(pk=current_user.id)

        new_deja = Deja(img_url=img_url, user=user)
        new_deja.save()

        return HttpResponseRedirect(reverse('deja:deja_results', args=(new_deja.id,)))

    return render(request, "deja.html")

@login_required
def deja_results(request, deja_id):
    ''' View for user to view Actor matches and view that performer's most recent projects '''

    # Stores the url of the most recently uploaded image
    uploaded_img = Deja.objects.get(pk=deja_id).img_url
    # Submits url to Sight Engine API
    results = get_celebs(uploaded_img)

    if request.method == 'POST':

        if request.POST.get('celeb_name'):
            celeb_name = request.POST['celeb_name']

            if request.session.get('credits') and request.session['credits']['celeb_name'] == celeb_name:
                return render(request, "films.html", request.session['credits'])
            else:
                # IMDPy fetch for result's filmography
                ia = imdb.IMDb()
                celeb = ia.search_person(celeb_name)
                celebID = celeb[0].personID
                person = ia.get_person(celebID)
                filmography = person['filmography']

                # Reduce list to most recent 5 entries to pass to template
                most_recent = []

                for value in filmography[0].values():
                    for film in value:
                        if len(most_recent) < 5:
                            # Shows all commands available for film
                            # print(dir(film))
                            movieID = film.getID()
                            movie = ia.get_movie(movieID)
                            # print(movie.infoset2keys)

                            if movie.get('cover url'):
                                link = "http://www.imdb.com/title/tt" + movieID + "/"
                                credit = {'link': link, 'title': film}
                                most_recent.append(credit)
                                print(most_recent)
                            # print("URL: ", ia.get_imdbURL(movie))
                            # IMDB url format
                            # http://www.imdb.com/title/tt3215824/

                                # print(movie.get_fullsizeURL())

                # Returns url of actor headshot OR default message if none available!
                no_headshot = "No headshot available"
                headshot = person.get('full-size headshot', no_headshot)

                context = {'headshot': headshot, 'most_recent': most_recent, 'celeb_name': celeb_name, 'celebID': celebID}
                request.session['credits'] = context

                return render(request, "films.html", request.session['credits'])

        elif request.POST.get("note"):
            return HttpResponseRedirect(reverse("deja:note", args=(deja_id,)))

        elif request.POST.get("save_deja"):
            if results:
                for celeb in results:
                    deja = Deja.objects.get(pk=Deja.objects.latest('created').id)
                    name = celeb['name']
                    probability = celeb['prob']

                    new_result = Result(deja=deja, name=name, probability=probability)
                    new_result.save()
                messages.info(request, "Deja Saved")
                return HttpResponseRedirect(reverse("deja:index"))

        elif request.POST.get('delete'):
            deja_id = request.POST['delete']
            deja = Deja.objects.get(pk=deja_id)
            deja.delete()
            messages.info(request, "Deja Deleted")
            return HttpResponseRedirect(reverse("deja:index"))

        elif request.POST.get('back'):
            return HttpResponseRedirect(reverse("deja:deja_results", args=(deja_id,)))

        elif request.POST.get('watchlist_add'):
            current_user = request.user
            # if the credit has been checked, it is added to the database
            if 'credit' in request.POST:
                watch_items = request.POST.getlist('credit')
                print(watch_items)
                saved = False

                for item in watch_items:
                    # checks if title already exists on watchlist, and does not add.
                    try:
                        title = Queue.objects.get(title=item)
                        messages.warning(request, f"{item} is already in your Queue")
                    except:
                        title = item
                        link = item.link
                        user_id = current_user.id

                        queue_item = Queue(title=title, link=link, user_id=user_id)
                        queue_item.save()
                        saved = True
                if saved == True:
                    messages.info(request, "dejaQueue Updated")
            else:
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

    return render(request, "note/note.html", {'note_form': note_form})

@login_required
def history(request):
    '''View of a user's created Dejas'''
    current_user = request.user
    # Grabs all dejas created by the current user
    dejas = Deja.objects.filter(user_id=current_user.id).order_by('-id')

    # Get highest probability match for alt tag

    if request.method == 'POST':
        # Pulls the clicked deja's id to pass to deja_results view
        if request.POST.get('deja'):
            deja_id = request.POST['deja']
            return HttpResponseRedirect(reverse("deja:deja_results", args=(deja_id,)))
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
    to_watch = Queue.objects.filter(user_id=current_user.id, watched=False)
    watched = Queue.objects.filter(user_id=current_user.id, watched=True)

    if request.method == 'POST':

        if request.POST.get('remove'):
            watchlist_id = request.POST['remove']
            watchlist_item = Queue.objects.get(pk=watchlist_id)
            watchlist_item.delete()
            messages.info(request, "Queue Updated")
            return HttpResponseRedirect(reverse('deja:watchlist'))
        elif request.POST.get('watch'):
            watchlist_id = request.POST['watch']
            watchlist_item = Queue.objects.get(pk=watchlist_id)
            watchlist_item.watched = False
            watchlist_item.save()
            messages.info(request, "Queue Updated")
            return HttpResponseRedirect(reverse('deja:watchlist'))
        elif request.POST.get('watched'):
            watchlist_id = request.POST['watched']
            watchlist_item = Queue.objects.get(pk=watchlist_id)
            watchlist_item.watched = True
            watchlist_item.save()
            messages.info(request, "Queue Updated")
            return HttpResponseRedirect(reverse('deja:watchlist'))

    return render(request, "watchlist.html", {'to_watch': to_watch, 'watched': watched})
