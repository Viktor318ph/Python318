# board_games/forms.py

from django import forms

from .models import BoardGame, BoardGameImage, Comment, Project

from django.forms.widgets import ClearableFileInput

class MultipleFileInput(ClearableFileInput):
    allow_multiple_selected = True


class BoardGameForm(forms.ModelForm):
    class Meta:
        model = BoardGame
        fields = ['title', 'description', 'rules', 'min_players', 'max_players', 'average_playtime', 'image']
        widgets = {
            'title': forms.TextInput(attrs={'class': 'form-control'}),
            'description': forms.Textarea(attrs={'class': 'form-control', 'rows': 3}),
            'rules': forms.Textarea(attrs={'class': 'form-control', 'rows': 5}),
            'min_players': forms.NumberInput(attrs={'class': 'form-control'}),
            'max_players': forms.NumberInput(attrs={'class': 'form-control'}),
            'average_playtime': forms.NumberInput(attrs={'class': 'form-control'}),
            'image': forms.ClearableFileInput(attrs={'class': 'form-control'}),
        }


class BoardGameImageForm(forms.ModelForm):
    image = forms.ImageField(widget=forms.ClearableFileInput(attrs={'class': 'form-control'}), required=False)

    class Meta:
        model = BoardGameImage
        fields = ['image']


class BoardGameImageDeleteForm(forms.ModelForm):
    delete = forms.BooleanField(required=False, label="Удалить изображение")

    class Meta:
        model = BoardGameImage
        fields = ['delete']

class CommentForm(forms.ModelForm):
    class Meta:
        model = Comment
        fields = ['text']
        widgets = {
            'text': forms.Textarea(attrs={'class': 'form-control', 'rows': 3}),
        }


class ProjectForm(forms.ModelForm):
    class Meta:
        model = Project
        fields = ['title', 'description']
        widgets = {
            'title': forms.TextInput(attrs={'class': 'form-control'}),
            'description': forms.Textarea(attrs={'class': 'form-control', 'rows': 3}),
        }
