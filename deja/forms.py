from django.contrib.auth.models import User
from django import forms
from deja.models import *

class UserForm(forms.ModelForm):
    password = forms.CharField(widget=forms.PasswordInput())

    class Meta:
        model = User
        fields = ('username', 'password')

class NoteForm(forms.ModelForm):
    '''form for adding a note'''

    class Meta:
        model = Note
        fields = ('text',)
        labels = {
            'text': '',
            }