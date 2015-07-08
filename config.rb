Encoding.default_external = 'utf-8'

activate :livereload
activate :syntax

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'
set :sass, line_comments: false

sprockets.append_path File.join root, 'vendor'

configure :build do
  activate :minify_css
  activate :minify_javascript

  activate :asset_hash
  activate :relative_assets
end
