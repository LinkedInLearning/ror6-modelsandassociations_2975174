# Ruby on Rails 6 Models and Associations
This is the repository for the LinkedIn Learning course Ruby on Rails 6 Models and Associations. The full course is available from [LinkedIn Learning](LICOURSEURL).

[![COURSENAME](COURSEIMAGE)](LICOURSEURL)

COURSE DESCRIPTION
Ruby on Rails can speed up and improve your development of full-featured web applications because it provides powerful tools that give structure and automate common data tasks. In this course, learn about the built-in features of models and associations in Rails. Apply named scopes, validations, callbacks, and associations to a sample project. Find out how to build smarter models by adding attributes not in the database and leveraging efficient queries. Walk through the use of available validation methods and helpers. Learn how to implement custom validations and to write and add automatic actions, known as callbacks. Explore effective use of Active Record associations, investigate belongs-to-many relationships and rich associations, and learn how to write queries that span several tables. 

## Instructions
This repository has branches for each of the videos in the course. You can use the branch pop up menu in github to switch to a specific branch and take a look at the course at that stage, or you can add `/tree/BRANCH_NAME` to the URL to go to the branch you want to access.

## Branches
The branches are structured to correspond to the videos in the course. The naming convention is `CHAPTER#_MOVIE#`. As an example, the branch named `02_03` corresponds to the second chapter and the third video in that chapter.
Some branches will have a beginning and an end state. These are marked with the letters `b` for "beginning" and `e` for "end". The `b` branch contains the code as it is at the beginning of the movie. The `e` branch contains the code as it is at the end of the movie. The `master` branch holds the final state of the code when in the course.

## Installing
1. To use these exercise files, you must have the following installed:
	- Ruby
	- Ruby on Rails
	- MySQL
2. Clone this repository into your local machine using the terminal (Mac), CMD (Windows), or a GUI tool like SourceTree.
3. If you have not already done so, create a MySQL database called `simple_cms_development` and set up a database user with permission to access it. Add the database user credentials to `config/database.yml`. Navigate to the root of the Rails application and run `bundle exec rails otl:import`. A script will run and walk you through the steps to import the tables and data you need to run the sample project in the exercise files.
