# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# Add comments to each article

# Names
# commenters = [
#   "Alice", "Bob", "Charlie", "David", "Ella",
#   "Frank", "Grace", "Hannah", "Ivy", "Jack",
#   "Karen", "Leo", "Mona", "Nina", "Oscar"
# ]

# Comments
# comments = [
#   "Great article!", "Very informative.", "I learned a lot from this post.",
#   "Interesting perspective.", "Thanks for sharing!", "Well written!",
#   "I disagree with some points.", "This was helpful.", "Can you elaborate?",
#   "Fantastic read!", "I loved the insights.", "This made me think.",
#   "More details would be great.", "Excellent content!", "I appreciate your work."
# ]

# Get all the existing articles
# articles = Article.all

# articles.each do |article|
#     puts "Processing: #{article.title}, Existing Comments: #{article.comments.count}"
#     if article.comments.count == 0
#       4.times do
#         comment = article.comments.create(commenter: commenters.sample, body: comments.sample, status: "Public")
#         puts comment.persisted? ? "Comment added" : "Failed: #{comment.errors.full_messages}"
#       end
#     elsif article.comments.count == 1
#       3.times do
#         comment = article.comments.create(commenter: commenters.sample, body: comments.sample, status: "Public")
#         puts comment.persisted? ? "Comment added" : "Failed: #{comment.errors.full_messages}"
#       end
#     end
#   end
  
# ------------------------------------------------------------------------------------------------------------

# Add more articles

# articles_data = [
#   { title: "Where the Wild Things are", body: "This article will explore the wildlife on hiking trails.", category: "Hiking" },
#   { title: "European Football Leagues", body: "A deep dive into European Football Leagues.", category: "Football (Soccer)" },
#   { title: "Your Local Asian Supermarket", body: "Become an experienced shopper at your local Asian supermarket.", category: "Food" },
#   { title: "Hiking Apps", body: "Learn about the best apps for hiking, offering insights and trails.", category: "Hiking" },
#   { title: "Mastering the Art of Football", body: "Learn essential football skills, from dribbling to passing, to become a better player.", category: "Football (Soccer)" },
#   { title: "Healthy Cooking", body: "How to cook healthy, easy, and delicious meals with minimal ingredients.", category: "Food" }
# ]

# # List of authors
# authors = [
#   { name: "Charlie Brown" },
#   { name: "Sally Brown" },
#   { name: "Lucy Van Pelt" },
#   { name: "Marcie" },
#   { name: "Woodstock" },
#   { name: "Snoopy" }
# ]

# # Loop through the article data
# articles_data.each do |article_data|
#   # Find the Category object by name
#   category = Category.find_by(name: article_data[:category])
#   puts category
#   # Select a random author from the authors list
#   author = Author.find_by(name: authors.sample[:name])  # Ensure the author exists
#   puts author
#   # Check if the category exists before creating the article
#   if category
#     # Create the article with the found category and selected author
#     article = Article.create!(
#       title: article_data[:title],
#       body: article_data[:body],
#       category_id: category.id,   # Assign category_id
#       author_id: author.id,       # Assign author_id
#       status: "Public"
#     )
#     puts "Article '#{article.title}' created successfully!"
#   else
#     puts "Error: Category '#{article_data[:category]}' not found for article '#{article_data[:title]}'"
#   end
# end
