from django.contrib.auth import logout, login, authenticate
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse, HttpResponseRedirect, Http404
from django.shortcuts import render
from django.urls import reverse
from django.template import RequestContext
from deja.forms import *
from deja.models import *
import pyrebase
from deja.api.sightengine import get_celebs

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
    index_template = "index.html"
    return render(request, index_template)

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
        print(request.POST)

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

def deja(request):
    ''' View for user to create a Deja '''

    # Creates an instance of a Deja in database upon clicking "Deja"
    current_user = request.user

    if request.method == 'POST':
        img_url = request.POST["url"]
        user = User.objects.get(pk=current_user.id)

        new_deja = Deja(img_url=img_url, user=user)
        new_deja.save()

        return HttpResponseRedirect(reverse('deja:deja_results'))

    return render(request, "deja.html")

def deja_results(request):
    # Stores the url of the most recently uploaded image
    uploaded_img = Deja.objects.latest('created').img_url
    # Submits url to Sight Engine API
    results = get_celebs(uploaded_img)

    if results:
        for celeb in results:
            deja = Deja.objects.get(pk=Deja.objects.latest('created').id)
            name = celeb['name']
            probability = celeb['prob']

            new_result = Result(deja=deja, name=name, probability=probability)
            print(new_result)
            new_result.save()
            print("Result saved!")

    return render(request, "deja_results.html", {'results': results, 'uploaded_img': uploaded_img})

def history(request):
    return render(request, "history.html")