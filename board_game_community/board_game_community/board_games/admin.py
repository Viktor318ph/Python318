# board_games/admin.py

from django.contrib import admin

from blog.models import Post
from .models import BoardGame, BoardGameImage, Comment, Project


@admin.register(BoardGame)
class BoardGameAdmin(admin.ModelAdmin):
    list_display = ('title', 'author', 'min_players', 'max_players', 'average_playtime', 'created_at')
    list_filter = ('created_at', 'author')
    search_fields = ('title', 'description', 'rules')


class BoardGameImageInline(admin.TabularInline):
    model = BoardGameImage
    extra = 1


@admin.register(BoardGameImage)
class BoardGameImageAdmin(admin.ModelAdmin):
    list_display = ('board_game', 'image')

@admin.register(Comment)
class CommentAdmin(admin.ModelAdmin):
    list_display = ('author', 'content_object', 'created_at')
    list_filter = ('created_at', 'author')
    search_fields = ('text',)


@admin.register(Project)
class ProjectAdmin(admin.ModelAdmin):
    list_display = ('title', 'author', 'created_at')
    list_filter = ('created_at', 'author')
    search_fields = ('title', 'description')
