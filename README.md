# Eras

[badges]
[description]
[table of contents]
[content ideas: link to deployed app, setup, test suite, GQL queries and mutations, database schema and description of each table, contributors]

## Local Setup
- Versions
  - Rails 6.1.0
  - Ruby 2.5.3
- Fork and clone the repository
- `cd` in your local repo version and run the following commands to install gems and setup database:
  - `bundle` (if this fails, try to `bundle update` and then retry)
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
  - In config/applicaiton.rb, uncomment out line 15 (`require "sprockets/railtie"`)
  - `rails s`
  - You should be able to access the GraphQL interface via http://localhost:3000/graphiql