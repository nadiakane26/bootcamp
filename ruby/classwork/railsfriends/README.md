# Learn Ruby on Rails in 4 Hours - Full Course (YouTube)

## Completed Sections
- First Webpage and MVC Overview
- Application Partial Links and New Pages
- CRUD Scaffold
- Style App with Bootstrap
- Style Devise Views
- Associations
- More Associations
- Style Modifications
- Fun With the Controller

## Incompleted Sections
- [Heroku](https://stackoverflow.com/questions/71529163/problems-with-git-push-heroku-master-no-longer-working)

## Notes
- Delete button isn't working (Resolved)
```erb
<%= link_to "Sign Out", destroy_user_session_path, data: { turbo_method: :delete }, class: "nav-link" %>

# or ...
<td><%= link_to 'Delete', friend, method: :delete, data: { confirm: 'Are you sure?' }, class: "btn btn-outline-danger btn-sm" %></td>

```
- Are you sure? prompt isn't working
