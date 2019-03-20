# dejaView

Remember an actor with dejaView.

dejaView is a full stack web application written in Python using the Django framework that solves those “Who is that and what else have I seen them in?” moments often posed by amazing character actors. This CRUD app allows users to create a Deja by uploading a screenshot to Firebase, which is then run through SightEngine's facial recognition API which returns likely celebrity matches. Using IMDbPY, the user can see a performer's most recent credits, and add them to an interactive "dejaQueue".

### Why?

Before learning software development, I spent 15 years as a classically trained actor who has always leaned toward character roles. I've always had a huge appreciation for those familiar faces who appear in a show and immediately make me love the movie or show more because it is guaranteed that this actor is going to deliver a transformative performance, yet again. The problem is that these performers usually aren't top billed, so their names go unknown. dejaView helps people remember more of these unsung heroes and connects them to their filmography which may include indie releases with meatier roles.

# Setup

Clone this repository

```git clone https://github.com/CurtainUp/deja-view.git```

Enable a virtual environment at the level above your project.

Use the following commands in your terminal:

```
virtualenv env
source env/bin/activate
```

Move to the project folder

```cd dejaview```

Install dependencies

```pip install -r requirements.txt```

Create your database

```makemigrations python manage.py makemigrations deja```

```migrate python manage.py migrate```

Run your server

```python manage.py runserver```

This will automatically load dejaView at ```http://localhost:8000```. To select another port, add the number you would like to use to the command above.

## Link to ERD

![dejaView ERD](static/DejaViewERD.png "dejaView_ERD")

## Dependencies

### Sightengine API
Facial recognition is performed via the Sightengine REST API. You must create an account to receive your own unique ```api_user``` and ```api_secret``` for calls to the API. Sign up for a free account [here](https://sightengine.com/pricing). Note that there are operation limits.

[GitHub Repo](https://github.com/Sightengine/client-python)
[Docs](https://sightengine.com/docs/)

###pyrebase
A simple python wrapper for the Firebase API.
[GitHub Repo](https://github.com/thisbejim/Pyrebase)

To learn more about how to use Firebase with Django, I highly recommend starting with [this video](https://www.hackanons.com/2018/03/python-django-with-google-firebase.html).

### IMDBpy
IMDbPY is a Python package useful to retrieve and manage the data of the IMDb movie database about movies, people, and companies. Note that the characters functionality has been removed.
[GitHub Repo](https://github.com/alberanid/imdbpy)
[Docs](https://imdbpy.sourceforge.io/)