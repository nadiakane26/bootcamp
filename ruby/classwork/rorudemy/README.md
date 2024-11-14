# Nadia's Articles App

Welcome to **Nadia's Articles**! This is a simple web application built using Ruby on Rails, following the beginner’s guide on [Udemy](https://www.udemy.com/course/ruby-on-rails-a-beginners-guide-free/). This app serves as an introduction to building web applications with Rails, focusing on authentication, CRUD functionality, and responsive design.

## Features
- User authentication (sign up, log in, and log out)
- Basic CRUD functionality for articles, comments, and users
- Responsive design with bootstrap styling
- Simple navigation menu

## Things to Watch Out For

### Sign-Out Link
In this app, the sign-out link is implemented using the following code:
```erb
<%= link_to "Sign Out", destroy_user_session_path, data: { turbo_method: :delete }, class: "nav-link" %>
```
To ensure this works correctly with Turbo (Rails 7), make sure you include the following in your `application.html.erb`

```erb
<%= stylesheet_link_tag "application", "data-turbo-track": "reload" %>
<%= javascript_include_tag "turbo" ,type: "module" %>
```

For more explanation this setup, check the following resources
- [Github](https://github.com/rails/rails/issues/44185) 
- [StackOverflow - Ruby On Rails 7 - Delete method not working](https://stackoverflow.com/questions/70446101/ruby-on-rails-7-delete-method-not-working)
- [StackOverflow - Rails & Devise using POST request for sign out. How can I change this to a DELETE request?](https://stackoverflow.com/questions/65863898/rails-devise-using-post-request-for-sign-out-how-can-i-change-this-to-a-delet)

### Styling with Yeti or Other Themes
For the design, this app uses the [Bootswatch Version 3](https://bootswatch.com/3/) theme. You can easily switch to another Bootswatch theme if you'd like.

### Dropdown Menu in Navbar
To implement the dropdown menu in the navigation bar, add the following scripts to the bottom of your `nav.html.erb` (before the `</body>` tag):
Add the this to the bottom of the nav.html
```html
<script src="
//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js"></script>
<script src="//netdna.bootstrapcdn.com/bootstrap/3.1.1/js/bootstrap.min.js"></script>
```
### Things That Yet To Complete
- Pushing to Heroku: I encountered issues while trying to push the app to Heroku. 
- Sendgrid, Email Recovery