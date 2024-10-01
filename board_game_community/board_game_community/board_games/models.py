# board_games/models.py

from django.contrib.auth.models import User
from django.contrib.contenttypes.fields import GenericForeignKey
from django.contrib.contenttypes.models import ContentType
from django.db import models
from django.db.models import Count


class PopularBoardGameManager(models.Manager):
    def get_queryset(self):
        return super().get_queryset().annotate(like_count=Count('likes')).order_by('-like_count')


class BoardGame(models.Model):
    title = models.CharField(max_length=200)
    description = models.TextField()
    rules = models.TextField()
    min_players = models.PositiveIntegerField()
    max_players = models.PositiveIntegerField()
    average_playtime = models.PositiveIntegerField(help_text="Average playtime in minutes")
    author = models.ForeignKey(User, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    likes = models.ManyToManyField(User, related_name='liked_board_games', blank=True)

    # Новое поле для одного изображения
    image = models.ImageField(upload_to='board_games/', blank=True, null=True)

    objects = models.Manager()
    popular = PopularBoardGameManager()

    def __str__(self):
        return self.title


class BoardGameImage(models.Model):
    board_game = models.ForeignKey(BoardGame, related_name='images', on_delete=models.CASCADE)
    image = models.ImageField(upload_to='board_games/')

class Comment(models.Model):
    content_type = models.ForeignKey(ContentType, on_delete=models.CASCADE)
    object_id = models.PositiveIntegerField()
    content_object = GenericForeignKey('content_type', 'object_id')

    author = models.ForeignKey(User, on_delete=models.CASCADE)
    text = models.TextField()
    created_at = models.DateTimeField(auto_now_add=True)

    def __str__(self):
        return f'Comment by {self.author} on {self.content_object}'


class Project(models.Model):
    title = models.CharField(max_length=200)
    description = models.TextField()
    author = models.ForeignKey(User, on_delete=models.CASCADE)
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    likes = models.ManyToManyField(User, related_name='liked_projects', blank=True)

    def __str__(self):
        return self.title
