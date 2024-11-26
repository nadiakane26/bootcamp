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
# ----- Mock up comments using faker name and faker text with lorem ipsum
# Find articles with IDs 14, 20 to 30, and 32
# Find articles with IDs 14, 20 to 30, and 32
# IDs for articles to be found
article_ids = [14] + (20..30).to_a + [32]

# Loop through each article ID and create comments if the article is found
article_ids.each do |id|
  article = Article.find_by(id: id)  # Use find_by to safely handle missing articles

  # If the article is not found, skip to the next one
  next unless article

  20.times do
    Comment.create(
      article: article, 
      commenter: Faker::Name.name,
      body: Faker::Lorem.sentence(word_count: 20)
    )
  end
end
