# board_games/views.py
from django import forms
from django.contrib import messages
from django.contrib.auth.decorators import login_required
from django.contrib.auth.models import User
from django.core.paginator import Paginator
from django.db.models import Q
from django.shortcuts import render, get_object_or_404, redirect
from rest_framework import generics

from blog.models import Post
from users.forms import UserUpdateForm, ProfileUpdateForm
from .forms import BoardGameForm, BoardGameImageForm, CommentForm, ProjectForm, BoardGameImageDeleteForm
from .models import BoardGame, BoardGameImage, Comment, Project
from .serializers import BoardGameSerializer, ProjectSerializer


class BoardGameListAPI(generics.ListAPIView):
    queryset = BoardGame.objects.all()
    serializer_class = BoardGameSerializer


class ProjectListAPI(generics.ListAPIView):
    queryset = Project.objects.all()
    serializer_class = ProjectSerializer


def board_game_list(request):
    board_games = BoardGame.objects.all().order_by('-created_at')

    # Фильтрация по заголовку
    title_query = request.GET.get('title')
    if title_query:
        board_games = board_games.filter(title__icontains=title_query)

    # Фильтрация по количеству игроков
    players_query = request.GET.get('players')
    if players_query:
        board_games = board_games.filter(Q(min_players__lte=players_query) & Q(max_players__gte=players_query))

    # Фильтрация по автору
    author_query = request.GET.get('author')
    if author_query:
        board_games = board_games.filter(author__username__icontains=author_query)

    paginator = Paginator(board_games, 9)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    return render(request, 'board_games/board_game_list.html', {'page_obj': page_obj})


def board_game_detail(request, pk):
    board_game = get_object_or_404(BoardGame, pk=pk)
    images = board_game.images.all()

    comments = Comment.objects.filter(content_type__model='boardgame', object_id=pk).order_by('-created_at')

    # Пагинация комментариев
    paginator = Paginator(comments, 10)
    page_number = request.GET.get('page')
    comments_page = paginator.get_page(page_number)

    if request.method == 'POST':
        comment_form = CommentForm(request.POST)
        if comment_form.is_valid():
            new_comment = comment_form.save(commit=False)
            new_comment.content_object = board_game
            new_comment.author = request.user
            new_comment.save()
            return redirect('board_game_detail', pk=pk)
    else:
        comment_form = CommentForm()

    return render(request, 'board_games/board_game_detail.html', {
        'board_game': board_game,
        'images': images,
        'comments': comments_page,
        'comment_form': comment_form
    })


@login_required
def board_game_create(request):
    if request.method == 'POST':
        form = BoardGameForm(request.POST, request.FILES)
        if form.is_valid():
            board_game = form.save(commit=False)
            board_game.author = request.user
            board_game.save()
            return redirect('board_game_detail', pk=board_game.pk)
    else:
        form = BoardGameForm()

    return render(request, 'board_games/board_game_form.html', {'form': form})


@login_required
def board_game_edit(request, pk):
    board_game = get_object_or_404(BoardGame, pk=pk)
    if request.user != board_game.author:
        return redirect('board_game_detail', pk=pk)

    if request.method == 'POST':
        form = BoardGameForm(request.POST, request.FILES, instance=board_game)
        if form.is_valid():
            board_game = form.save()
            return redirect('board_game_detail', pk=board_game.pk)
    else:
        form = BoardGameForm(instance=board_game)

    return render(request, 'board_games/board_game_form.html', {'form': form})



@login_required
def board_game_delete(request, pk):
    board_game = get_object_or_404(BoardGame, pk=pk)
    if request.user != board_game.author:
        return redirect('board_game_detail', pk=pk)
    if request.method == 'POST':
        board_game.delete()
        return redirect('board_game_list')
    return render(request, 'board_games/board_game_confirm_delete.html', {'board_game': board_game})


@login_required
def like_board_game(request, pk):
    board_game = get_object_or_404(BoardGame, pk=pk)
    if request.user in board_game.likes.all():
        board_game.likes.remove(request.user)
    else:
        board_game.likes.add(request.user)
    return redirect('board_game_detail', pk=pk)


def popular_board_games(request):
    board_games = BoardGame.popular.all()[:9]
    return render(request, 'board_games/popular_board_games.html', {'board_games': board_games})


def project_list(request):
    projects = Project.objects.all().order_by('-created_at')
    paginator = Paginator(projects, 9)
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    return render(request, 'board_games/project_list.html', {'page_obj': page_obj})


def project_detail(request, pk):
    project = get_object_or_404(Project, pk=pk)
    comments = Comment.objects.filter(content_type__model='project', object_id=pk).order_by('-created_at')

    if request.method == 'POST':
        comment_form = CommentForm(request.POST)
        if comment_form.is_valid():
            new_comment = comment_form.save(commit=False)
            new_comment.content_object = project
            new_comment.author = request.user
            new_comment.save()
            return redirect('project_detail', pk=pk)
    else:
        comment_form = CommentForm()

    return render(request, 'board_games/project_detail.html', {
        'project': project,
        'comments': comments,
        'comment_form': comment_form
    })


@login_required
def project_create(request):
    if request.method == 'POST':
        form = ProjectForm(request.POST)
        if form.is_valid():
            project = form.save(commit=False)
            project.author = request.user
            project.save()
            return redirect('project_detail', pk=project.pk)
    else:
        form = ProjectForm()
    return render(request, 'board_games/project_form.html', {'form': form})


@login_required
def project_edit(request, pk):
    project = get_object_or_404(Project, pk=pk)
    if request.user != project.author:
        return redirect('project_detail', pk=pk)
    if request.method == 'POST':
        form = ProjectForm(request.POST, instance=project)
        if form.is_valid():
            project = form.save()
            return redirect('project_detail', pk=project.pk)
    else:
        form = ProjectForm(instance=project)
    return render(request, 'board_games/project_form.html', {'form': form})


@login_required
def project_delete(request, pk):
    project = get_object_or_404(Project, pk=pk)
    if request.user != project.author:
        return redirect('project_detail', pk=pk)
    if request.method == 'POST':
        project.delete()
        return redirect('project_list')
    return render(request, 'board_games/project_confirm_delete.html', {'project': project})


@login_required
def like_project(request, pk):
    project = get_object_or_404(Project, pk=pk)
    if request.user in project.likes.all():
        project.likes.remove(request.user)
    else:
        project.likes.add(request.user)
    return redirect('project_detail', pk=pk)


def search(request):
    query = request.GET.get('q')
    if query:
        board_games = BoardGame.objects.filter(Q(title__icontains=query) | Q(description__icontains=query))
        blog_posts = Post.objects.filter(Q(title__icontains=query) | Q(content__icontains=query))
        projects = Project.objects.filter(Q(title__icontains=query) | Q(description__icontains=query))
    else:
        board_games = BoardGame.objects.all()
        blog_posts = Post.objects.all()
        projects = Project.objects.all()

    context = {
        'board_games': board_games,
        'blog_posts': blog_posts,
        'projects': projects,
        'query': query
    }
    return render(request, 'board_games/search_results.html', context)


def user_profile(request, username):
    user = get_object_or_404(User, username=username)
    board_games = BoardGame.objects.filter(author=user).order_by('-created_at')
    projects = Project.objects.filter(author=user).order_by('-created_at')
    blog_posts = Post.objects.filter(author=user).order_by('-created_at')

    if request.method == 'POST' and request.user == user:
        u_form = UserUpdateForm(request.POST, instance=user)
        p_form = ProfileUpdateForm(request.POST, request.FILES, instance=user.profile)
        if u_form.is_valid() and p_form.is_valid():
            u_form.save()
            p_form.save()
            messages.success(request, 'Ваш профиль был обновлен!')
            return redirect('user_profile', username=username)
    else:
        u_form = UserUpdateForm(instance=user)
        p_form = ProfileUpdateForm(instance=user.profile)

    context = {
        'profile_user': user,
        'board_games': board_games,
        'projects': projects,
        'blog_posts': blog_posts,
        'u_form': u_form,
        'p_form': p_form
    }
    return render(request, 'board_games/user_profile.html', context)


def home(request):
    latest_board_games = BoardGame.objects.order_by('-created_at')[:5]
    latest_blog_posts = Post.objects.order_by('-created_at')[:5]
    latest_projects = Project.objects.order_by('-created_at')[:5]
    context = {
        'latest_board_games': latest_board_games,
        'latest_blog_posts': latest_blog_posts,
        'latest_projects': latest_projects,
    }
    return render(request, 'home.html', context)
