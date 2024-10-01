# board_games/urls.py

from django.urls import path
from . import views

urlpatterns = [
    path('', views.home, name='home'),
    path('board_games/', views.board_game_list, name='board_game_list'),
    path('board_game/<int:pk>/', views.board_game_detail, name='board_game_detail'),
    path('board_game/new/', views.board_game_create, name='board_game_create'),
    path('board_game/<int:pk>/edit/', views.board_game_edit, name='board_game_edit'),
    path('board_game/<int:pk>/delete/', views.board_game_delete, name='board_game_delete'),
    path('board_game/<int:pk>/like/', views.like_board_game, name='like_board_game'),
    path('popular/', views.popular_board_games, name='popular_board_games'),

    path('projects/', views.project_list, name='project_list'),
    path('project/<int:pk>/', views.project_detail, name='project_detail'),
    path('project/new/', views.project_create, name='project_create'),
    path('project/<int:pk>/edit/', views.project_edit, name='project_edit'),
    path('project/<int:pk>/delete/', views.project_delete, name='project_delete'),
    path('project/<int:pk>/like/', views.like_project, name='like_project'),

    path('api/board_games/', views.BoardGameListAPI.as_view(), name='board_game_list_api'),
    path('api/projects/', views.ProjectListAPI.as_view(), name='project_list_api'),

    path('search/', views.search, name='search'),
    path('user/<str:username>/', views.user_profile, name='user_profile'),
]