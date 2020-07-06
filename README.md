# AceBook

### [Notes from Sprint 1](https://github.com/tristanlangford/acebook-brainaics#notes-from-sprint-1) - [Notes from Sprint 2](https://github.com/tristanlangford/acebook-brainaics#notes-from-sprint-2) 

### Challenge progress overview:
* Currently, all elements of CRUD are implemented, including an editing feature that is permitted for ten minutes only.
* The users are able to make a time-stamped and username-stamped post, which is presented in reverse chronological order.
* They can sign-up, sign-in, and log out. 


### Team
* [Tristan Langford](https://github.com/tristanlangford)
* [Rachael Ewins](https://github.com/RaeRachael)
* [Nick Butler](https://github.com/nwmbutler)
* [Sophie Brown](https://github.com/sofyloafy)

## Notes from Sprint 1

### Team Users

#### Coding Achievements

* Sign-in, Sign-up and Sign-out done. These features were done using the clearance gem, which created many of the routes and useful functions but needed to be fine-tuned to fit our specific test case, eg. password length.
* Rerouting browser to sign-in if they aren't signed in and make a request to the posts route.

#### Challenges in Feature Implementation

Using a gem is useful but does hide some important functionality which was a pain to find at times

#### Small things to think about in Future Sprints

* A few test are currently in the pending state, as they were generated by clearance and require the email functionality of the email given by users which we didn't look into as it wasn't part of the user authentication ticket.
* There could be an alert or useful message when redirecting unsigned in users to the sign-in page.

### Team Posts

#### Coding Achievements

* Posts have Time and Date created visible, as well as information about which user created them (currently user_id and not the user's username)
* Posts are displayed in reverse chronological order based on time created.
* Post can accept multiple lines and display multiple lines.

#### Challenges in Feature Implementation

* Database migrations, when creating new columns and foreign keys. There were a few times where Travis checks and local checks didn't work due to small mistakes in creating the database migrations, but I feel we have a better understanding of this now
* Timezone errors when using the datatype timestamp in the posts database, highlighted by the UK currently in BST and Travis defaulting to UTC:0. Going back to timestamp datatype has made the test passing, but we are a little unsure about how the database and therefore the display will work if people from different timezones used the app.
* We haven't yet found a good way to test the multiple line feature, the feature is clearly visible in a manual test, but we aren't sure of a way to get the tests to enter a return character.

#### Small things to think about in Future Sprints

* The display in the posts view current uses the user_id and not the user's username.
* Functionality across timezones (possibly it is already fine?)
* Getting a test for multiple line posts

### Group Work

#### Coding Achievements

* Getting Heroku to host the app
* Getting Travis to act as our CI
* Beginning to build a project rubocop style guide
* Adding Coverage checking to the project

#### Small things to think about in Future Sprints

* Currently there is an unexpected terminal output when test are run
* Adding a test for minimun code coverage
* Looking into code climate
* Further edits to the rubocop file - currently 7 offences in master

## Notes from Sprint 2

### Team CSS

#### Coding Achievements

* Bootstrap gem implemented to begin base styling for app, including reworking container size and formatting.
* Use of placeholder values for sign-up/ sign-in pages.
* Sign-up/ sign-in containers are centre-aligned vertically 

#### Challenges in Feature Implementation

* Bootstrap took longer to suss out than expected, and as a product, some pages remain without styling.
* Centre-aligning containers with Bootstrap's containers proved challenging. This resulted in a bit of DIY CSS, rather than using Bootstrap.

#### Small things to think about in Future Sprints

* Implementing CSS for the entire app without breaking things.


### Team Posts

#### Coding Achievements

* Posts are printed alongside the username, rather than user_id.
* Update and Delete features completed. These are user-specified, and a helpful message appears when a user attempts to amend a post they did not submit.
* Additionally, the Update feature is only available for 10 minutes after posting. Once the time has elapsed, a helpful message appears when they attempt to edit their post.

#### Challenges in Feature Implementation

* Covering all bases for test cases was a challenge. It took a while to realise how to implement checks in Rails. We eventually used a before_action filter to implement the Update (within 10 minutes) and Delete features.
* In order to print the username in place of the user_id, "has_many" & "belongs_to" were used in User and Post classes respectively, but again, these took a while to figure out.

#### Small things to think about in Future Sprints
<i> This currently remains the same as the previous sprint </i>

* Getting a test for multiple line posts

### Group Work

#### Coding Achievements

* Implementation of TimeCop gem to test for post editing window.
* Implementation of a test for minimun code coverage
* Further edits to the Rubocop file in order to customise formatting
* Coverage file successfully added to .gitignore file to econimise timespent 



#### Small things to think about in Future Sprints
<i> These currently remains the same as the previous sprint </i>

* Currently there is an unexpected terminal output when test are run
* Looking into code climate


REQUIRED INSTRUCTIONS:

1. Fork this repository to `acebook-teamname` and customize
the below**

[You can find the engineering project outline here.](https://github.com/makersacademy/course/tree/master/engineering_projects/rails)

2. The card wall is here: <please update>

## How to contribute to this project
See [CONTRIBUTING.md](CONTRIBUTING.md)

## Quickstart

First, clone this repository. Then:

```bash
> bundle install
> bin/rails db:create
> bin/rails db:migrate

> bundle exec rspec # Run the tests to ensure it works
> bin/rails server # Start the server at localhost:3000
```
