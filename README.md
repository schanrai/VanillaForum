# README

# Vanilla Forum

Vanilla Forum is a standalone forum platform app for Rails that aims to be a basic no-frills forum web application. The end goal is to have an application that that provides the basic functionality of forums, topics and posts with some of the more popular content and social features of platforms such as Quora and Reddit.

## Installation

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

The repo location : (https://github.com/schanrai/VanillaForum.git)

Fork this repository from GitHub and clone your forked copy down to your local environment. Open a new terminal window and cd into the VanillaForum root directory.

Type `bundle install` into the terminal to load all of the Ruby Gems and dependencies into your app. Start up the PostgreSQL server and type `rails db:setup` into the terminal. This allows PostgreSQL to create two new databases (development and test). Next, type `rails db:migrate`. This step runs the table migrations in the app, which gives the database instructions on what kind of data it should look to receive and to which models and attributes the data corresponds.

To start up the Rails server, which renders your app on the web therefore allowing users to interact with it, type `rails s` in the terminal. You should now be able to open up a new browser window and navigate to (http://localhost:3000/) and see the VanillaForum homepage displayed. From there, either log in or sign up and play!

## Usage

Watch a demo of it [here.](https://www.youtube.com/watch?v=5P-135Uf-mE&feature=youtu.be)


## Built With

*Ruby - the backend programming language
*Ruby on Rails - the web framework for Ruby
*Omniauth-Facebook the third party authentication provider
*Bootstrap -a frontend framework for styling
*Bcrypt - for password encryption
*Faker - a gem used to populate data
*HTML + CSS - the frontend language

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.


## License
[MIT](https://choosealicense.com/licenses/mit/)
