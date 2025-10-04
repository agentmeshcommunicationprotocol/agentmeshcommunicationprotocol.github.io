source "https://rubygems.org"

# GitHub Pages gem
gem "github-pages", "~> 228", group: :jekyll_plugins

# Jekyll plugins
group :jekyll_plugins do
  gem "jekyll-feed", "~> 0.12"
  gem "jekyll-sitemap", "~> 1.4"
  gem "jekyll-seo-tag", "~> 2.6"
  gem "jekyll-paginate", "~> 1.1"
  gem "jekyll-redirect-from", "~> 0.16"
  gem "jekyll-archives", "~> 2.2"
  gem "jekyll-gist", "~> 1.5"
  gem "jekyll-github-metadata", "~> 2.13"
end

# Development and testing gems
group :development, :test do
  gem "html-proofer", "~> 3.19"
  gem "rake", "~> 13.0"
  gem "webrick", "~> 1.7"
end

# Windows and JRuby specific gems
platforms :mingw, :x64_mingw, :mswin, :jruby do
  gem "tzinfo", "~> 1.2"
  gem "tzinfo-data"
end

# Performance-booster for watching directories on Windows
gem "wdm", "~> 0.1.1", :platforms => [:mingw, :x64_mingw, :mswin]
