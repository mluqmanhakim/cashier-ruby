# Simple POS System

This is a simple Point of Sale (POS) application built with Ruby on Rails 7 and SQLite3. It features role-based access control with `administrator` and `store_owner` roles.

## Prerequisites for macOS

*   **Homebrew:** The easiest way to install dependencies on macOS.
    *   `/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"`
*   **rbenv or rvm:** A Ruby version manager is highly recommended. (rbenv instructions below)
    *   `brew install rbenv ruby-build`
    *   Initialize rbenv in your shell (e.g., add `eval "$(rbenv init -)"` to your `~/.zshrc` or `~/.bash_profile`).
*   **Ruby:** Install the version specified in `.ruby-version` (currently 3.2.3, but check the file to be sure).
    *   `rbenv install 3.2.3`
    *   `rbenv global 3.2.3`
*   **Bundler:**
    *   `gem install bundler`

## Installation Steps

1.  **Clone the repository:**
    ```bash
    git clone <repository_url>
    cd pos
    ```

2.  **Install Ruby dependencies:**
    ```bash
    bundle install
    ```

3.  **Setup the Database:**
    This app uses SQLite3, so no separate database server is required. Run the following to create the database, run migrations, and seed the initial data:
    ```bash
    bin/rails db:setup
    ```
    *Note: The `db:setup` command runs `db:create`, `db:schema:load` (or `db:migrate`), and `db:seed`. The seed file creates an initial administrator account (`admin@example.com` / `password`).*

## Running the Application

1.  **Start the Rails server:**
    ```bash
    bin/rails server
    ```
2.  **Access the application:**
    Open your browser and navigate to `http://localhost:3000`

## Testing

To run the test suite:
```bash
bin/rails test
```

## Features
*   **Authentication:** Handled by Devise.
*   **Roles:**
    *   **Administrator:** Can access the system and register new Store Owners. (Default login from seeds: `admin@example.com` / `password`)
    *   **Store Owner:** Can log in and access the POS dashboard. Store owners cannot self-register.
