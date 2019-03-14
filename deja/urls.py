from django.urls import path
from . import views

app_name = "deja"
urlpatterns = [
    path('', views.index, name='index'),
    path('login', views.login_user, name='login'),
    path('logout', views.logout_user, name='logout'),
    path('register', views.register_user, name='register'),
    path('history', views.history, name='history'),
    path('deja', views.deja, name='deja'),
    path('deja_results/<int:deja_id>', views.deja_results, name='deja_results'),
    path('note/<int:deja_id>', views.note, name='note'),
    path('watchlist', views.watchlist, name='watchlist')
]