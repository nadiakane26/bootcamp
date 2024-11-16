# Learn Ruby on Rails in 4 Hours - Full Course (YouTube)

## Completed Sections
- First Webpage and MVC Overview
- Application Partial Links and New Pages
- CRUD Scaffold
- Style App with Bootstrap
- Style Devise Views
- Associations
- More Associations

## Incompleted Sections
- Style Modifications
- Fun With the Controller
- Git, GitHub, and Heroku

## Notes
- Delete button isn't working (Resolved)
```erb
<%= link_to "Sign Out", destroy_user_session_path, data: { turbo_method: :delete }, class: "nav-link" %>
```