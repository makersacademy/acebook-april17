# WEEK 1

## Day 1! Tues 23rd April 2019

#### Wardah & Bart:

* Learnt how to set up heroku app
* Learnt about automatic deployment and manual deployment
* The difference between CI (Continuous Integration) and CD (Continuous Deployment) is a lot clearer
* Got a better understanding on Travic CI, it checks if tests are passing and if there are any conflicts with master branch.

#### Greg & Sam:

Today we have had initial group discussions in order to plan our team-working strategy from the very beginning
of this project.  We have set daily start and finish times, as well as expectations regarding stand-ups and
retrospectives.  We have also considered the best way to ensure that all team members are exposed to and work
on all parts of the project.  We agreed to adopt an initial pair working protocol of changing partners between
every morning and afternoon session.

Upon conclusion of this meeting, we broke into three pairs and worked on the self-allocated set-up tasks which
were provided to us in the project specification.  Sam and I worked on adding Rubocop, SimpleCov and Flog, which
are a linter, a test coverage checker and a complexity analyser respectively.  We have learnt that Flog provides
us with a score and we have discovered that a score of 20 or under is optimal.  Scores of over 200 are possible,
but highly inadvisable.  

Sam has shared the following resource (https://codeclimate.com/blog/deciphering-ruby-code-metrics/) which
explains the rationale behind and usefulness of the various metrics we are utilising in this project.

## Day 2! Weds 24th April 2019

#### Sam & Bart:

- Deployed Heroku from the command line.
- Set up the database using db:Migrate.
- Touched on ActiveRecord.
- Branching out for help when stuck on a problem caused it to move
along more swiftly. Also talking with our wonderful client (*wink wink Mike*)
caused us as a group to be assured that we were headed in the right direction.

### Retro after sprint 1
- Didn't skimp on the setup - took a long time but it was worth it
- Everyone knew what everyone else was doing
- Different pair taking on automated deployment when Sam/Bart were fried from looking at it
- Harry asking others for help with the deployment to Heroku
- Appreciated the explanation from Harry on the existing code so that we didn't duplicate effort

- We don't know enough about rails to be able to do this yet
- We didn't change pairs at lunch time - maybe try to stick to this?

## Day 3! Thurs 25th April 2019

#### Wardah & Bart:

- Added a sign up form
- Made sure it was adding data into our database
- Added a log in form as well (created sessions controller for it and redirected it to posts page)
- Worked on the email authentication feature in backend (preventing incorrect email entry in DB)
- Added a regex code in the User model file as a security measure
- Tested it by manipulating the HTML in frontend and then checked DB, it wasn't added to the DB. Yay!

## Day 4! Fri 26th April 2019

#### Greg & Bart:

- Manually wrote back-end code which ensures email addresses at sign-up are valid.
- If email address is valid, data is sent to DB and a verification 'flash' message is displayed.
- If email address is invalid, data is not sent to DB and a distinct verification 'flash' message is displayed.  
- Used TDD process throughout compilation of new code.  
- As the back-end check is a safeguard against malicious modification of front-end email validity check, we have manually made 'malicious' modifications to check that our new code is fit for purpose.
- Checked Flog data complexity score to ensure it remains below 10, which classifies as 'awesome'.
- Identified and used Rubocop autocorrect tool to improve code quality.
- Have monitored code coverage which is currently at 98%.

#### Harry & Wardah:

- Learnt about how sessions work in Rails
- Learnt about destroying a session

#### Andy & Sam:
 - rails generate migration AddUserRefToPosts user:references - if you run this in the command line it will autogenerate a migration file. The "user:references" will create the foreign key details. Needs double checking for correct syntax
 - if you make a field non-null in the database when there is data in the table already, you need to populate that field first or remove those rows.
 - sessions are not in scope of all controllers, you may need a method in a file where they are in scope which returns the session information to files where it is not in scope. We did this in the controller's helper file - checkout the sessions stuff we've done
 - you should always WHICH tests are failing so you don't spend ages looking at the wrong thing :-)
 - don't merge your own pull requests
 - DO write tests!

 **RETRO WAS CONDUCTED USING A TRELLO BOARD ON FRIDAY 26th: [Retro board](https://trello.com/b/5lC2dyZo/retro-26419)**

# WEEK 2
## Day 1! Mon 29th April 2019




## Day 2! Tues 30th April 2019

#### Sam (pairing with Wardah) 
- Wardah and I discovered that using `||=` in the `current_user` method would return incorrect results when we tried to update our session. We removed the pipe `||` and everything then worked OK and the tests all passed correctly. We're not entirely sure what the pipe even does.


## Day 3! Weds 1st May 2019
#### Sam (working on a useful error message when attempting to delete someone else's post)
- When trying to debug my work on showing a useful error message, I discovered that the logout functionality was broken but the test was still passing. This was because the test looked for the text "login" on the page and the error message displayed the word "login"! Not helpful, but we've now added to the test to make it more likely to pickup an error in the page rather than interpretting the error as the right result. 

#### Greg & Wardah (working on a function to prevent duplicate sign-ups with same email address)
- Started off by writing a unit test which checked that only one specific email address was entered into the database even though we had tried to enter the same email address twice.  
- Discovered a uniqueness function which prevents duplicate entries in DB - this solved the problem.  
- Added a feature test which checked for an flash error message when an email address is used a second time.  
- Accessed the production db to remove duplicate entries that had previously been accepted into the database.  
- Used TablePlus to access a remote rather than a local db.  
