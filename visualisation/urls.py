from django.conf.urls import url
from . import views   

urlpatterns = [
   # url(r'^visualisation$', views.home),
    url(r'^$', views.home),
    url(r'^article/(?P<id_article>\d+)$', views.view_article),
    url(r'^ajax/supprimer/$', views.supprimer, name='supprimer'),
    ]


