[![Build Status](https://travis-ci.org/davmcgregor/acebook-off-the-rails.svg?branch=master)](https://travis-ci.org/davmcgregor/acebook-off-the-rails)
[![Maintainability](https://api.codeclimate.com/v1/badges/f5bf98cd33614e91f9a0/maintainability)](https://codeclimate.com/github/davmcgregor/acebook-off-the-rails/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/f5bf98cd33614e91f9a0/test_coverage)](https://codeclimate.com/github/davmcgregor/acebook-off-the-rails/test_coverage)

### [Makers Academy](http://www.makersacademy.com) - Week 8/9 Team programming challenge 

# AceBook 👍

https://offtherails-acebook.herokuapp.com/

#### Technologies: Ruby, Rspec, Capybara, Rails, HTML, CSS, TravisCI, CodeClimate

[Task](#Task) | [Collaborators](#Collaborators) | [Installation Instructions](#Installation) | [User Stories](#User_Stories) | [Mockup](#Mockup) | [Further improvements](#Further_Improvements)

![off-the-rails](https://miro.medium.com/max/600/1*ZpB4NIQ1BrKTReRF5b0yFw.png)

## <a name="Task">The Task</a>

Build a facebook clone using Rails that allows users to sign up, log in and make posts.

This challenge is the second team programming challenge at [Makers Academy](https://github.com/makersacademy).

## <a name="Collaborators">Collaborators</a>

* [Elena Beccaro](https://github.com/elebecca)
* [Richard Pattinson](https://github.com/richardpattinson)
* [Ziad Soobratty](https://github.com/zsoobratty)
* [Toby Dawson](https://github.com/tobydawson1)
* [David Stewart](https://github.com/DavidStewartLDN)
* [David McGregor](https://github.com/davmcgregor)

## <a name="Installation">Installation Instructions</a>

First, clone this repository. Then:

```bash
> bundle install
> bin/rails db:create
> bin/rails db:migrate

> bundle exec rspec # Run the tests to ensure it works
> bin/rails server # Start the server at localhost:3000
```
To run tests:
```bash
> rspec # Run the tests
> rubocop # Check code quality
```

## <a name="User_Stories">User Stories</a>

```
As a user,
So I can log into Acebook,
I would like to create an account
```
```
As a user,
So that I don't accidentally type in the wrong email,
I would like an error message if I type a non-valid email
```
```
As a user,
So my account is secure,
I would like to enter a password of 6-10 characters
```
```
As a user,
To use the site,
I would like to be redirected ot posts after logging in/signing up
```
```
As a user,
So that only I can post stories with my ID,
I want users that are not logged in to be directed to log in
```
```
As a user,
So I prove my identity,
I want to be able to enter my email and passwords
```
```
As a user,
To share what I'm up to,
I would like to be able to make a post
```
```
As a user,
In order to correct mistakes,
I would like to be able to edit my posts up to 10 mins after they were created
```
```
As a user,
So I can't update/delete other peoples posts (like an idiot),
I would like to see a helpful error message
```
```
As a user,
To know the context of a post,
I would like to see the date, time and author of a post
```
```
As a user,
So I can be kept up to date,
I would like to see the most recent posts first
```
```
As a user,
So that my posts are easy to read,
I would like to be abe to make posts using line breaks
```

## <a name="Mockup">Mockup</a>

![Mockup](planning/Day-1-wireframes.jpg)

## <a name="Further_Improvements">Further Improvements</a>

* Styling
* More features


