# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb

# Array of random commenters' names
commenters = [
  "Alice", "Bob", "Charlie", "David", "Ella",
  "Frank", "Grace", "Hannah", "Ivy", "Jack",
  "Karen", "Leo", "Mona", "Nina", "Oscar"
]

# Array of random comment bodies
comments = [
  "Great article!", "Very informative.", "I learned a lot from this post.",
  "Interesting perspective.", "Thanks for sharing!", "Well written!",
  "I disagree with some points.", "This was helpful.", "Can you elaborate?",
  "Fantastic read!", "I loved the insights.", "This made me think.",
  "More details would be great.", "Excellent content!", "I appreciate your work."
]

# Fetch all existing articles
articles = Article.all

articles.each do |article|
    puts "Processing: #{article.title}, Existing Comments: #{article.comments.count}"
    if article.comments.count == 0
      4.times do
        comment = article.comments.create(commenter: commenters.sample, body: comments.sample, status: "Public")
        puts comment.persisted? ? "Comment added" : "Failed: #{comment.errors.full_messages}"
      end
    elsif article.comments.count == 1
      3.times do
        comment = article.comments.create(commenter: commenters.sample, body: comments.sample, status: "Public")
        puts comment.persisted? ? "Comment added" : "Failed: #{comment.errors.full_messages}"
      end
    end
  end
  
