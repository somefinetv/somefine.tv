###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

page "/episodes/*", layout: :episode
page "/episodes.rss", layout: false

# Proxy pages (https://middlemanapp.com/advanced/dynamic_pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", :locals => {
#  :which_fake_page => "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# /foo instead of /foo.html
activate :directory_indexes

# Reload the browser automatically whenever files change
configure :development do
  activate :livereload

  set :http_prefix, "http://localhost:4567"
end

# Methods defined in the helpers block are available in templates
helpers do
  def page_title
    [current_page.data.title, site_name].compact.join(" | ")
  end

  def episodes
    @episodes ||= sitemap.resources.find_all do |resource|
      resource.path =~ %r{episodes/.*\.html}
    end.sort_by do |resource|
      episode_number(resource)
    end.reverse
  end

  def episode_number(episode)
    File.basename(episode.source_file).sub(".markdown", "")
  end

  def path_to_audio(page)
    "/files/#{episode_number(page)}.m4a"
  end

  def site_url
    config[:http_prefix]
  end

  def site_name
    "Some Fine Television"
  end

  def full_url(path)
    "#{config[:http_prefix]}#{path}"
  end

  def rfc822_timestamp(timeish)
    timeish.to_time.rfc822
  end

  def copyright_date
    starting = 2015

    if (current = Date.today.year) > starting
      "#{starting}–#{current}"
    else
      starting
    end
  end
end

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

set :partials_dir, 'partials'

# Build-specific configuration
configure :build do
  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :asset_hash

  # Use relative URLs
  activate :relative_assets

  # Or use a different image path
  set :http_prefix, "http://somefine.tv"
end
