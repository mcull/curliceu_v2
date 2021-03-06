# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.css, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )
Rails.application.config.assets.precompile += %w( vendor/modernizr.js )
Rails.application.config.assets.precompile += %w( jquery.color-2.1.2.js )
Rails.application.config.assets.precompile += %w( math.uuid.js )
Rails.application.config.assets.precompile += %w( order.js )
Rails.application.config.assets.precompile += %w( foundation.css )
Rails.application.config.assets.precompile += %w( app.css )
Rails.application.config.assets.precompile += %w( ribbon.css )
Rails.application.config.assets.precompile += %w( fonts.css )
