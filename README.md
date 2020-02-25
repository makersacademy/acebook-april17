# LizardBook

[You can find the engineering project outline here.](https://github.com/makersacademy/course/tree/master/engineering_projects/rails)

## Card Wall:
https://trello.com/b/ODg1c9f4/lizardbook-by-team-lizard

## Team Blog:
https://medium.com/team-lizard

## Quickstart

First, clone this repository. Then:

```bash
> bundle install
> bin/rails db:create
> bin/rails db:migrate

> bundle exec rspec # Run the tests to ensure it works
> bin/rails server # Start the server at localhost:3000
```

------
### Authors
- Heli Sivunen: https://github.com/PacificRebel
- Josh Davies: https://github.com/JoshDavies
- James Clark: https://github.com/jmhc22
- Pamela Mezue: https://github.com/Mezela
- Jess Lonsdale: https://github.com/jlonsdale
- Duncan Skinner: https://github.com/Duncan9099

MVP User Stories: (have this working by the end of wednesday)

- Users can sign up
- Users get errors for incorrect sign ins
- Users can view profile pages
- Users can log in with a username and password and log out

- Users can make posts 
- Users can view posts and see who made them
- Users can delete their own posts
- Users can edit posts

- Users can make comments on posts
- Users can view comments

User Table

ID|username|password|profile|email|full_name|lizard_species|birthday|
  
Post Table

ID|contents|userID|created_at|updated_at|

Comment Table

ID|postID|contents|userID(the person who made the comment)|created_at|updated_at
 

