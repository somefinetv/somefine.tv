task :build do
  sh "middleman build"
end

task release: :build do
  # year-month-day-hourminute
  timestamp = Time.now.strftime('%Y-%m-%d-%H%M')
  sh "git tag '#{timestamp}' && git push --tag"
  deploy "patrickbyrne.net"
end

def deploy(host)
  sh "rsync -avz --delete build/ #{host}:/var/www/#{host}/public"
end
