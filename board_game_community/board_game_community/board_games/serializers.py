# board_games/serializers.py

from rest_framework import serializers

from .models import BoardGame, Project


class BoardGameSerializer(serializers.ModelSerializer):
    class Meta:
        model = BoardGame
        fields = ['id', 'title', 'description', 'author', 'min_players', 'max_players', 'average_playtime',
                  'created_at']


class ProjectSerializer(serializers.ModelSerializer):
    class Meta:
        model = Project
        fields = ['id', 'title', 'description', 'author', 'created_at']
