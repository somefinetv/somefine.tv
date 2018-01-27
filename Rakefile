task :build do
  sh "middleman build"
end

task release: :build do
  # year-month-day-hourminute
  timestamp = Time.now.strftime('%Y-%m-%d-%H%M')
  sh "git tag '#{timestamp}' && git push --tag"
  deploy
end

def deploy
  sh "aws s3 sync build/ s3://somefine-tv --profile personal"
end
