require 'httparty'
require 'json'

def analyze_github_repositories(username)
  response = HTTParty.get("https://api.github.com/users/#{username}/repos")
  repos = JSON.parse(response.body)

  most_starred_repo = repos.max_by { |repo| repo['stargazers_count'] }

  puts "Most Starred Repository:"
  puts "Name: #{most_starred_repo['name']}"
  puts "Description: #{most_starred_repo['description']}"
  puts "Stars: #{most_starred_repo['stargazers_count']}"
  puts "URL: #{most_starred_repo['html_url']}"
end

analyze_github_repositories('moxie0')