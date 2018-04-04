# schedule_api_rails

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version
  - 2.4.0
* Rails version
  - 5.0.5

* System dependencies
  * rspec-rails - Testing framework.
  * factory_girl_rails - A fixtures replacement with a more straightforward syntax.
  * shoulda_matchers - Provides RSpec with additional matchers.
  * database_cleaner - Gem to clean our test database to ensure a clean state in each test suite.
  * faker - A library for generating fake data.

## Configuration
  * Database creation
    * Prepare database (Create database, load schema and initialize seeds)
    ```shell
      rails db:setup
    ```

  * Database initialization
    * Load schema and initialize seeds
    ```shell
      rails db:schema:load
      rails db:seed
    ```

  * Reset database
    * Resseting database
    ```shell
      rails db:reset -> rails db:drop db:setup.
    ```

    * Update schema file
    ```shell
      rails db:schema:dump
      rails db:migrate:reset
    ```
  * Prepare database for test
    ```shell
    rails db:test:prepare
    ```

* How to run the test suite
  ```shell
    bundle exec rspec spec/
  ```
