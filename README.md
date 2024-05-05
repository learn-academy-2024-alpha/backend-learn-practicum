# 📝 Note Sharing Application

This application is the backend of a decoupled full-stack application that allows users to make notes and share those notes with other users.

### 🧱 Technologies and Versions

- Rails API with a PostgreSQL database
- Rails 7.1.3.2
- Ruby 3.2.0
- PSQL 14.10

### ✅ Onboarding to the App

- To run the app in a development environment, clone the repository and run
  - `bundle`
  - `rails db:setup`
- To spin up a local server run the command `rails s`
- The application will run locally at `http://localhost:3000/`

### ⚙️ Testing

Testing is handled by RSpec

- Run the test suite with command `rspec spec`
- GitHub Actions will run a CI pipeline for testing and linting

### 🗄️ Data Models

- User (from Devise): email, password, username
- Note: title, content, public
- Users have many notes
- Notes have many users

### 🫧 Linting

Check for linting errors in the project by running:

```bash
standardrb
```

Fix most lint issues in the project by running:

```bash
standardrb --fix
```

### 🤝 Application Dependencies

- [RSpec](https://rubygems.org/gems/rspec-rails/versions/3.4.2?locale=en)
- [Devise](https://github.com/heartcombo/devise)
- [JWT](https://github.com/jwt/ruby-jwt)
- [Standard Ruby](https://github.com/standardrb/standard?tab=readme-ov-file)
- [Faker](https://github.com/faker-ruby/faker)
- [Debug](https://github.com/ruby/debug)

### 🗄️ Useful Resources

A few of the many resources that helped to build this application.

- [GitHun Actions Building and testing Ruby](https://docs.github.com/en/actions/automating-builds-and-tests/building-and-testing-ruby)

### 🚀 Deployment

- The application is deployed on Render.com and available at [this url]()
