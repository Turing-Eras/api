# Eras
![rails-badge](https://img.shields.io/badge/Rails-6.1.0-informational?style=flat-square) ![ruby-badge](https://img.shields.io/badge/Ruby-2.5.3-informational?style=flat-square) ![build-badge](https://img.shields.io/travis/turing-eras/api/main?style=flat-square) ![closed-pr-badge](https://img.shields.io/github/issues-pr-closed-raw/turing-eras/api?style=flat-square)

This GraphQL on Rails API [insert live endpoint link] serves queries and mutations to Eras [insert live FE link], an application that allows you to visualize your life wholistically in order to live more intentionally.

By providing info on personal events, you will be shown a visual calendar of your life. The intent is that by viewing the seemingly fleeting weeks that add up to years and decades, you are able to cherish the little moments and appreciate [insert stuff].

[insert screenshots]

## Readme Content
- [User Interface](#user-interface)
- [Local Setup](#local-setup)
- [Test Suite](#test-suite)
- [GraphQL Schema](#graphql-schema)
- [Database Schema](#database-schema)
- [Project Board](#project-board)
- [Contributors](#contributors)

## User Interface
- Deployed application (insert link)
- [Frontend repo](https://github.com/Turing-Eras/front_end)
  - Stack: React, Typescript

## Local Setup
- Versions
  - Rails 6.1.0
  - Ruby 2.5.3
- Fork and clone the repository
- `cd` in your local repo version and run the following commands
  - To install gems:
    -  `bundle` (if this fails, try to `bundle update` and then retry)
  - To setup database:
    - `rails db:create`
    - `rails db:migrate`
    - `rails db:seed`
- Create a manifest.js file nested under app/assets/config and place the following inside:
  ```
  //= link graphiql/rails/application.css
  //= link graphiql/rails/application.js
  ```
  - This file is ignored by git tracking but is necessary to run the server locally.
- Run your own development server:
  - In config/application.rb, uncomment out line 15 (`require "sprockets/railtie"`)
  - `rails s`
  - You should be able to access the GraphQL interface and see available queries and mutations via http://localhost:3000/graphiql

## Test Suite
- Run with `bundle exec rspec`
- All tests should be passing
- 83.24% test coverage


## GraphQL Schema
 - Insert list of queries and mutations available
 - Is there way to nicely get the Documentation (shown when going to /graphiql?)

## Database Schema
 - ![our schema](/schema.png)
 - Insert description of each table

## Project Board
 - [GitHub project](https://github.com/orgs/Turing-Eras/projects/1)
 - Next steps / epics for development:
   - User authentication

## Authors
- Angela Guardia |  [Github](https://github.com/AngelaGuardia)  |  [LinkedIn](https://www.linkedin.com/in/angela-guardia/)
- Daniel Halverson |  [Github](https:Gi.com/dhalverson)  |  [LinkedIn](https://www.linkedin.com/in/daniel-halverson/)
- Leah Riffell |  [Github](https://github.com/leahriffell)  |  [LinkedIn](https://www.linkedin.com/in/leah-riffell/)
- Luke Hunter James-Erickson  |  [Github](https://github.com/LHJE)  |  [LinkedIn](https://www.linkedin.com/in/luke-hunter-james-erickson-b65682143/)
