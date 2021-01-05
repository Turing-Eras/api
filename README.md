# Eras
![rails-badge](https://img.shields.io/badge/Rails-6.1.0-informational?style=flat-square) ![ruby-badge](https://img.shields.io/badge/Ruby-2.5.3-informational?style=flat-square) ![build-badge](https://img.shields.io/travis/turing-eras/api/main?style=flat-square) ![closed-pr-badge](https://img.shields.io/github/issues-pr-closed-raw/turing-eras/api?style=flat-square)

This [GraphQL on Rails API](insert live endpoint link) serves queries and mutations to [Eras](insert live FE link), an application that allows you to visualize your life holistically in order to live more intentionally.

By providing info on personal events, you will be shown a visual calendar of your life. By viewing the seemingly fleeting weeks that add up to years and decades, you are able to appreciate the little moments, cherish the time you have with loved ones, and live with more intention.

With Eras, you'll see your life in a whole new way.

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
- [Deployed application](insert link)
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
  - You should be able to access the GraphQL interface and see available queries and mutations via the docs on http://localhost:3000/graphiql

## Test Suite
- Run with `bundle exec rspec`
- All tests should be passing
- 83.24% test coverage


## GraphQL Schema
- Queries available:
  <details><summary>Get Single Era:</summary>
    ```
    {
      getEra(id: #{id}) {
        id
        userId
        name
        startDate
        endDate
        color
        createdAt
        updatedAt
      }
    }
    ```
    </details>
  <details><summary>Get Single Event: </summary>
    ```
    {
      getEvent(id: "#{event_id}") {
        name
        date
        color
      }
    ```
    </details>
  <details><summary>Get Single User:</summary>
    ```
    {
      getUser(id: #{id}) {
        id
        name
        email
        birthdate
        eras {
          id
          userId
          name
          startDate
          endDate
          color
          createdAt
          updatedAt
        }
        events {
          id
          userId
          name
          date
          color
          createdAt
          updatedAt
        }
      }
    }
    ```
    </details>
  <details><summary>Get All Users:</summary>
    ```
    {
      getUsers {
        id
        name
        email
        birthdate
        eras {
          id
        }
      }
    }
    ```
    </details>
- Mutations available:
  <details><summary>Create User: </summary>
    ```
    mutation {

    }
    ```
    </details>
  <details><summary>Update User:</summary>
    ```
    mutation {
      updateUser(input:{
          id: #{user_id}
          name: "NEW NAME"
          email: "NEW EMAIL"
          birthdate: "NEW BIRTHDATE"
          }) {
            id
            name
            email
            birthdate
            eras {
              id
            }
          }
        }
    ```
    </details>
  <details><summary>Create Era:</summary>
    ```
    mutation {

    }
    ```
    </details>
  <details><summary>Update Era:</summary>
    ```
    mutation {

    }
    ```
    </details>
  <details><summary>Delete Era:</summary>
    ```
    mutation {
      deleteEra(input:{
          id: #{era_id}
          }){
            id
          }
        }
    ```
    </details>
  <details><summary>Create Event:</summary>
    ```
    mutation {

    }
    ```
    </details>
  <details><summary>Update Event:</summary>
    ```
    mutation {
      updateEvent(input:{
          id: #{event_id}
          name: "NEW NAME"
          date: "NEW DATE"
          color: "NEW COLOR"
          }) {
            id
            name
            date
            color
          }
        }
    ```
    </details>
  <details><summary>Delete Event:</summary>
    ```
    mutation {
      deleteEvent(input:{
          id: #{event_id}
          }){
            id
          }
        }
    ```
    </details>
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
