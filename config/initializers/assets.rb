# Be sure to restart your server when you modify this file.

# Version of your assets, change this if you want to expire all your assets.
Rails.application.config.assets.version = '1.0'

# Add additional assets to the asset load path
# Rails.application.config.assets.paths << Emoji.images_path

# Precompile additional assets.
# application.js, application.sass, and all non-JS/CSS in app/assets folder are already added.
# Rails.application.config.assets.precompile += %w( search.js )

js_prefix    = 'app/assets/javascripts/'
style_prefix = 'app/assets/stylesheets/'
image_prefix = 'app/assets/images/'

javascripts = Dir["#{js_prefix}**/*.*"].map      { |x| x.gsub(js_prefix,    '') }
css         = Dir["#{style_prefix}application.sass"].map  { |x| x.gsub(style_prefix, '') }
enterprise_controllers = Dir["#{style_prefix}enterprise/**/*.*"].map  { |x| x.gsub(style_prefix, '') }
front_end_controllers = Dir["#{style_prefix}front_end/**/*.*"].map  { |x| x.gsub(style_prefix, '') }
development_controllers = Dir["#{style_prefix}development/**/*.*"].map  { |x| x.gsub(style_prefix, '') }
image       = Dir["#{image_prefix}**/*.*"].map { |x| x.gsub(image_prefix, '') }

puts "---------------------- START OF COMPILED ASSETS ----------------------"
puts Rails.application.config.assets.precompile = (javascripts + css + image + enterprise_controllers + front_end_controllers + development_controllers)
puts "----------------------- END OF COMPILED ASSETS -----------------------"
puts '\n'