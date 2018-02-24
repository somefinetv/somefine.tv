desc "Build the site without deploying"
task :build do
  sh "middleman build"
end

desc "Build and deploy the site"
task release: :build do
  # year-month-day-hourminute
  timestamp = Time.now.strftime('%Y-%m-%d-%H%M')
  sh "git tag '#{timestamp}' && git push --tag"
  deploy
end

def deploy
  sh %{aws s3 sync build/ s3://somefine-tv --profile personal}
  sh %{aws s3 cp s3://somefine-tv s3://somefine-tv --recursive --exclude="*" --include="images/*" --include="stylesheets/*" --include="javascripts/*" --metadata-directive REPLACE --cache-control max-age=31536000,public --profile personal}
end
