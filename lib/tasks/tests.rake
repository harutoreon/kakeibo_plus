task :tests do
  if Rails.env.development?
    sh "bundle exec bundle-audit check --update"
    sh "bundle exec brakeman -q -w2"
    sh "bundle exec rubocop"
    sh "bundle exec rspec"
    sh "bin/importmap audit"
  end
end
