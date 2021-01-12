<img src="eras-logo-horizontal.png" width="300"><br>

![rails-badge](https://img.shields.io/badge/Rails-6.1.0-informational?style=flat-square) ![ruby-badge](https://img.shields.io/badge/Ruby-2.5.3-informational?style=flat-square) ![build-badge](https://img.shields.io/travis/turing-eras/api/main?style=flat-square) ![closed-pr-badge](https://img.shields.io/github/issues-pr-closed-raw/turing-eras/api?style=flat-square)


This [GraphQL on Rails API](https://eras-api.herokuapp.com/) serves queries and mutations to [Eras](insert live FE link), an application that allows you to holistically visualize your life in order to live more intentionally.

After providing info on personal events, you will be shown a visual calendar of your life. By viewing the seemingly fleeting weeks that add up to years and decades, you are able to appreciate the little moments, cherish the time you have with loved ones, and live with more intention.

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
- [Deployed application](https://eras-api.herokuapp.com/)
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
- Run your own development server:
  - `rails s`
  - You should be able to access the GraphQL interface and see available queries and mutations via the docs on [http://localhost:3000/graphiql](http://localhost:3000/graphiql)

## Test Suite
- Run with `bundle exec rspec`
- All tests should be passing
- 100.0% test coverage

## GraphQL Schema
- Queries available:
  - Get Single Era: <details>
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
  - Get Single Event: <details>
    ```
    {
      getEvent(id: "#{event_id}") {
        name
        date
        color
      }
    ```
    </details>
  - Get Single User: <details>
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
  - Get All Users: <details>
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
  - Create User: <details>
    ```
    mutation {
      createUser(input:{
          name: "#{name}"
          email: "#{email}"
          birthdate: "#{birthdate}"
          }){
            id
            name
            email
            birthdate
            events {
              id
            }
            eras {
              id
            }
          }
        }
    ```
    </details>
  - Update User: <details>
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
  - Create Era: <details>
    ```
    mutation {
          createEra(input:{
              userId: #{id}
              name: "NAME"
              startDate: "START DATE"
              endDate: "START DATE"
              color: "COLOR CODE"
              }) {
                id
                userId
                name
                startDate
                endDate
                color
              }
            }
    ```
    </details>
  - Update Era: <details>
    ```
    mutation {
          updateEra(input:{
              id: #{era_id}
              name: "NEW NAME"
              startDate: "NEW START DATE"
              endDate: "NEW END DATE"
              color: "NEW COLOR CODE"
              }) {
                id
                userId
                name
                startDate
                endDate
                color
              }
            }
    ```
    </details>
  - Delete Era: <details>
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
  - Create Event: <details>
    ```
    mutation {
      createEvent(input:{
          userId: "#{userId}"
          name: "#{name}"
          date: "#{date}"
          color: "#{color}"
          }) {
            id
            userId
            name
            date
            weekNumber
            color
          }
        }
    ```
    </details>
  - Update Event: <details>
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
  - Delete Event: <details>
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

## Database Schema
- ![our schema](/schema.png)
- Description of tables:
  - Users: all user accounts (at this point, user must sign up in order to generate a calendar)
  - Eras: a life event that occurs between a period of dates
  - Event: a life event that occurs on one date 
  - Questions: list of questions that user can answer to generate events and eras
    - Questions will be a part of onboarding on default if `onboarding` equals true

## Project Board
- [GitHub project](https://github.com/orgs/Turing-Eras/projects/1)
- Next steps / epics for development:
  - User authentication
  - Extended onboarding
  - Ability to share calendar
  - Media attachments (videos, photos)
  - Visual representation of questions answered vs. questions left

## Authors
- Angela Guardia |  [Github](https://github.com/AngelaGuardia)  |  [LinkedIn](https://www.linkedin.com/in/angela-guardia/)
- Daniel Halverson |  [Github](https:Gi.com/dhalverson)  |  [LinkedIn](https://www.linkedin.com/in/daniel-halverson/)
- Leah Riffell |  [Github](https://github.com/leahriffell)  |  [LinkedIn](https://www.linkedin.com/in/leah-riffell/)
- Luke Hunter James-Erickson  |  [Github](https://github.com/LHJE)  |  [LinkedIn](https://www.linkedin.com/in/luke-hunter-james-erickson-b65682143/)
