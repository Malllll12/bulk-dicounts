# Little Esty Shop

## Background and Description

### Database Schema
![Screen Shot 2022-01-16 at 7 36 02 PM](https://user-images.githubusercontent.com/69017022/150058852-5c2156f7-e57c-4a2c-80b1-350fdb21cacf.png)


"Little Esty Shop" is a group project that requires students to build a fictitious e-commerce platform where merchants and admins can manage inventory and fulfill customer invoices. ActiveRecord and SQL were used to problem solve. It allows students to practice one-to-many and many-to-many database relationships, migrations. As well as MVC, CRUD functionality, and RESTful routing. We used a process of TDD to ensure accuracy.
Bulk-Discounts is a solo project addition to "Little Esty Shop". It adds functionality for merchants to create bulk discounts for their items. A discount based on the quantity of items the customer is buying, for example “20% off orders of 10 or more items”.


## Learning Goals
- Practice designing a normalized database schema and defining model relationships
- Utilize advanced routing techniques including namespacing to organize and group like functionality together.
- Utilize advanced active record techniques to perform complex database queries
- Practice consuming a public API while utilizing POROs as a way to apply OOP principles to organize code
- Write migrations to create tables and relationships between tables
- Implement CRUD functionality for a resource using forms (form_tag or form_with), buttons, and links
- Use MVC to organize code effectively, limiting the amount of logic included in views and controllers
- Use built-in ActiveRecord methods to join multiple tables of data, make calculations, and group data based on one or more attributes
- Write model tests that fully cover the data logic of the application
- Write feature tests that fully cover the functionality of the application

## Requirements
- must use Rails 5.2.x
- must use PostgreSQL
- all code must be tested via feature tests and model tests, respectively
- must use GitHub branching, team code reviews via GitHub comments, and github projects to track progress on user stories
- must include a thorough README to describe the project
- must deploy completed code to Heroku

## Setup

This project requires Ruby 2.7.2.

* Fork this repository
* Clone your fork
* From the command line, install gems and set up your DB:
    * `bundle`
    * `rails db:create`
* Run the test suite with `bundle exec rspec`.
* Run your development server with `rails s` to see the app in action.

## Phases

1. [Database Setup](./doc/db_setup.md)
1. [User Stories](./doc/user_stories.md)
1. [Extensions](./doc/extensions.md)
1. [Evaluation](./doc/evaluation.md)

### Contributors
- [Darren Kulback](https://github.com/dkulback) - [LinkedIn](https://www.linkedin.com/in/darren-kulback-9b2394189/) 
- [Eldridge Turambi](https://github.com/Eldridge-Turambi) - [LinkedIn](https://www.linkedin.com/in/eldridge-turambi-252218221/)
- [Hannah Warren](https://github.com/hannahkwarren) - [LinkedIn](https://www.linkedin.com/in/hannahkwarren/)
- [Mallory Vining](https://github.com/Malllll12) - [LinkedIn](https://www.linkedin.com/in/mallory-vining-b957b4221/)
