require 'net/http'
require 'json'

url = 'https://api.github.com/users/dhh/events/public'
uri = URI(url)
response = Net::HTTP.get(uri)
data = JSON.parse(response)

$score = 0

data.map do |u|
 if u['type'] == 'IssuesEvent'
   $score = $score + 7
 elsif u['type'] == 'IssueCommentEvent'
   $score = $score + 6
 elsif u['type'] == 'PushEvent'
   $score = $score + 5
 elsif u['type'] == 'PullRequestReviewCommentEvent'
   $score = $score + 4
 elsif u['type'] == 'WatchEvent'
   $score = $score + 3
 elsif u['type'] == 'CreateEvent'
   $score = $score + 2
 else
   $score = $score + 1
 end
end

puts "DHH's github score is #{$score}"
