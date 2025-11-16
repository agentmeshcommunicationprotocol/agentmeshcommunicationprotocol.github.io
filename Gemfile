source "https://rubygems.org"

# GitHub Pages gem - Latest stable version
gem "github-pages", "~> 231", group: :jekyll_plugins

# Jekyll plugins (included in github-pages, but explicitly listed for clarity)
group :jekyll_plugins do
  gem "jekyll-feed"
  gem "jekyll-sitemap"
  gem "jekyll-seo-tag"
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
