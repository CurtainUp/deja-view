from django.contrib.auth.models import User
from django.db import models

# Create your models here.
class Deja(models.Model):
    '''An instance of a user generated remembrance'''
    created = models.DateTimeField(auto_now_add=True)
    img_url = models.CharField(max_length=100, blank=False)
    user = models.OneToOneField(User, on_delete=models.PROTECT)

    # def __str__(self):
    #     '''string method that returns Deja's creator and id'''

    #     return (f"{self.id} {self.user.first_name} {self.user.last_name}")

class Result(models.Model):
    '''A returned facial match'''
    first_name = models.CharField(max_length=100, blank=False)
    last_name = models.CharField(max_length=100, blank=False)
    probability = models.FloatField(blank=False)
    deja = models.ForeignKey(Deja, on_delete=models.CASCADE)

    def __str__(self):
        '''string method that returns name and probability of result'''

        return (f"{self.first_name} {self.last_name} is a {self.probability} match.")

