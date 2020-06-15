[![Build Status](https://travis-ci.com/rbbri/acebook-gracebook.svg?branch=master)](https://travis-ci.com/rbbri/acebook-gracebook)

[![Waffle.io - Columns and their card count](https://badge.waffle.io/rbbri/acebook-gracebook.svg?columns=all)](https://waffle.io/rbbri/acebook-gracebook)

[![Coverage Status](https://coveralls.io/repos/github/rbbri/acebook-gracebook/badge.svg?branch=master)](https://coveralls.io/github/rbbri/acebook-gracebook?branch=master)



# AceBook

## Getting Started

First, clone this repository. Then:

```bash
> bundle install
> bin/rails db:create
> bin/rails db:migrate

> bundle exec rspec # Run the tests to ensure it works
> bin/rails server # Start the server at localhost:3000
```

## Using the app

The app is hosted on Heroku, it can be found at `https://grace-book.herokuapp.com/`

A user can:
- Sign up to AceBook
- Sign in to an account
- Sign out of an account
- Create a post
- Update their post
- Delete their post
- View all exisisting posts with the newest first

## Built with

- Ruby on Rails - the web framework
- ActiveRecord - the ORM (part of rails)
- Rspec and Capybara - the testing frameworks
- Travis used - CI
- Heroku - CD
- BCrypt - password encryption
