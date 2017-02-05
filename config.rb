# encoding: utf-8
# frozen_string_literal: true
Encoding.default_external = 'utf-8'

activate :directory_indexes
activate :syntax

set :css_dir, 'stylesheets'
set :js_dir, 'javascripts'
set :images_dir, 'images'
set :sass, line_comments: false

activate :sprockets

configure :development do
  activate :livereload
end

configure :build do
  activate :minify_css
  activate :minify_javascript

  activate :asset_hash
  activate :relative_assets
end
