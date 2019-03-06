from django.contrib.auth.models import User
from django.db import models

# Create your models here.
class Deja(models.Model):
    '''An instance of a user generated remembrance'''
    created = models.DateTimeField(auto_now_add=True)
    img_url = models.CharField(max_length=100, blank=False)
    user = models.ForeignKey(User, on_delete=models.PROTECT)

    def __str__(self):
        '''string method that returns Deja's creator and id'''

        return (f"ID: {self.id} IMG_URL: {self.img_url} USERNAME: {self.user.username}")

class Result(models.Model):
    '''A returned facial match'''
    first_name = models.CharField(max_length=100, blank=False)
    last_name = models.CharField(max_length=100, blank=False)
    probability = models.FloatField(blank=False)
    deja = models.ForeignKey(Deja, on_delete=models.CASCADE)

    def __str__(self):
        '''string method that returns name and probability of result'''

        return (f"{self.first_name} {self.last_name} is a {self.probability} match.")

# class Filmography(models.Model):
#     '''An instance of a match's film appearances'''
#     title = models.CharField(max_length=150, blank=False)
#     year = models.IntegerField(blank=False)
#     role = models.CharField(max_length=100, blank=False)
#     result = models.ForeignKey(Result, on_delete=models.CASCADE)

#     def __str__(self):
#         '''string method that returns title and role'''

#         return (f"They appeared as {self.role} in {self.title}")

class Note(models.Model):
    '''A note attached to a Deja'''
    text = models.TextField(blank=True)
    deja = models.ForeignKey(Deja, on_delete=models.CASCADE)

    def __str__(self):
        '''string method that returns text value'''

        return (f"Note: {self.text}")
