namespace :categories do
    desc "Backfill descriptions for existing categories"
    task backfill_descriptions: :environment do
      Category.where(description: [nil, ""]).find_each do |category| # Finds categories with no description or empty string
        category.update(description: "Default description for #{category.name}") # Updates description 
      end
      puts "Backfill completed for categories descriptions."
    end
  end