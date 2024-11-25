# Pin npm packages by running ./bin/importmap

pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"


pin "donation", to: 'donation.js'
pin "article", to: 'article.js'

pin "jquery", to: "https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"
pin "add_jquery", to: "add_jquery.js"

# Load more comments
pin "@hotwired/stimulus", to: "stimulus.min.js" # Pin Stimulus
pin_all_from "app/javascript/controllers", under: "controllers" # Auto-load all controllers
