# Basic Blog Application with Articles and Categories

This application is a simple blog that features articles organized by categories. It was built following the steps in the [Ruby on Rails Getting Started Guide version 8.0](https://guides.rubyonrails.org/getting_started.html) and includes a custom `Category` model for organizing articles.

## Features

- **Articles**: Create, view, edit, and delete blog posts.
- **Categories**: Organize articles by categories, allowing users to explore content by topic.

## Setup and Installation

```
rails new blog -d postgresql
bin/rails db:create
```

## Backfilling Category Descriptions

The following rake function was used to backfill category descriptions

```namespace :categories do
    desc "Backfill descriptions for existing categories"
    task backfill_descriptions: :environment do
      Category.where(description: [nil, ""]).find_each do |category| # Finds categories with no description or empty string
        category.update(description: "Default description for #{category.name}") # Updates description
      end
      puts "Backfill completed for categories descriptions."
    end
  end
```

To run this task, use the following command in the terminal:
```
rake categories:backfill_descriptions 
```

## Future Improvements

- Utilize Rails scaffolding to streamline development.
- Refining the design by further integrating Bootstrap styles.
