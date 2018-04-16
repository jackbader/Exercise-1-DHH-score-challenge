require 'net/http'
require 'json'

url = 'https://api.github.com/users/dhh/events/public'
uri = URI(url)
response = Net::HTTP.get(uri)
data = JSON.parse(response)

$score = 0

test = data.map do |u|
 if u['type'] == 'IssuesEvent'
   $score = $score + 7
   puts 'IssuesEvent'
 elsif u['type'] == 'IssueCommentEvent'
   $score = $score + 6
   puts 'IssueCommentEvent'
 elsif u['type'] == 'PushEvent'
   $score = $score + 5
   puts 'PushEvent'
 elsif u['type'] == 'PullRequestReviewCommentEvent'
   $score = $score + 4
   puts 'PullRequestReviewCommentEvent'
 elsif u['type'] == 'WatchEvent'
   $score = $score + 3
   puts 'WatchEvent'
 elsif u['type'] == 'CreateEvent'
   $score = $score + 2
   puts 'CreateEvent'
 else
   $score = $score + 1
   puts 'Other event'
 end
end

puts "DHH's github score is #{$score}"
