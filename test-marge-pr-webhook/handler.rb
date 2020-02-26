require 'json'

def hello(event:, context:)
  puts 'hello'
  puts JSON.pretty_generate(event.to_h)
  puts JSON.pretty_generate(JSON.parse(event['body']))
  body = JSON.parse(event['body'])
  puts "action: #{body['action']}"
  puts "ref: #{body['pull_request']['head']['ref']}"
  {
    statusCode: 200,
    body: {
      message: 'Go Serverless v1.0! Your function executed successfully!',
      input: event
    }.to_json
  }
end
