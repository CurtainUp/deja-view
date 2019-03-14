from django.contrib.auth.models import User
from django.db import models

# Create your models here.
class Deja(models.Model):
    '''An instance of a user generated remembrance'''
    created = models.DateTimeField(auto_now_add=True)
    img_url = models.CharField(max_length=100, blank=False)
    user = models.ForeignKey(User, on_delete=models.CASCADE)

    def __str__(self):
        '''string method that returns Deja's creator and id'''

        return (f"ID: {self.id} IMG_URL: {self.img_url} USERNAME: {self.user.username}")

class Result(models.Model):
    '''A returned facial match'''
    name = models.CharField(max_length=100, blank=False)
    probability = models.FloatField(blank=False)
    deja = models.ForeignKey(Deja, on_delete=models.CASCADE)

    def __str__(self):
        '''string method that returns name and probability of result'''

        return (f"{self.name} is a {self.probability} match.")

class Note(models.Model):
    '''A note attached to a Deja'''
    text = models.TextField(blank=True)
    deja = models.OneToOneField(Deja, on_delete=models.CASCADE)

    def __str__(self):
        '''string method that returns text value'''

        return (f"Note: {self.text}")

class Queue(models.Model):
    '''A movie or film on the user's watchlist'''
    title = models.CharField(max_length=100, blank=False)
    watched = models.BooleanField(default=False)
    user = models.ForeignKey(User, on_delete=models.CASCADE)

    def __str__(self):
        '''string method that returns the title and if it has been watched'''
        if self.watched == True:
            return (f"Queue: {self.user.username} has watched {self.title}")
        else:
            return (f"Queue: {self.user.username} has not watched {self.title}")
