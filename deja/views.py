from django.contrib.auth import logout, login, authenticate
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse, HttpResponseRedirect, Http404
from django.shortcuts import render
from django.template import RequestContext
from deja.forms import *
from deja.models import *

# Create your views here.
def index(request):
    index_template = 'index.html'
    return render(request, index_template)

def register_user(request):
    '''Handles the creation of a new user for authentication'''

    # A boolean value for telling the template whether the registration was successful.
    # Set to False initially. Code changes value to True when registration succeeds.
    registered = False

    # Create a new user by invoking the `create_user` helper method on Django's built-in User model
    if request.method == 'POST':
        user_form = UserForm(data=request.POST)

        if user_form.is_valid():
            # Save the user's form data to the database.
            user = user_form.save()

            # Now we has the password with the set_password helper method.
            # Once hashed, we can update the user object.
            user.set_password(user.password)
            user.save()

            # Update our variable to tell the template registration was successful.
            registered = True

        return login_url(request)

    elif request.method == 'GET':
        user_form = UserForm()
        register_template = 'register.html'
        return render(request, register_template, {'user_form': user_form})

def login_user(request):
    '''Handles the login of a registered user for authentication'''

    # Obtain the context for the user's request.
    context = {'next': request.GET.get('next', '/')}

    # If the request is a HTTP POST, try to pull out the relevant information.
    if request.method == 'POST':

        # Use the built-in authenticate method to verify
        email = request.POST['email']
        password = request.POST['password']
        authenticated_user = authenticate(email=email, password=password)

        # If authentication was successful, log the user in
        if authenticated_user is not None:
            login(request=request, user=authenticated_user)
            if request.POST.get('next') == '/':
                return HttpResponseRedirect('/')
            else:
                print("ELSE STATEMENT:", request.POST.get('next', '/'))
                return HttpResponseRedirect(request.POST.get('next', '/'))

        else:
            # Bad login details were provided. User cannot be logged in
            print("Invalid login details: (), ()".format(email, password))

    return render(request, 'login.html', context)

# Use the login_required() decorator to ensure only those logged in can access the view.
@login_required
def logout_user(request):
    # Since we know the user is logged in, we can now just log them out.
    logout(request)

    # Take the user back to the homepage.
    return HttpResponseRedirect('/')