require 'sinatra'

before do
  content_type :txt
end

get '/cache' do
  expires 3600, :public, :must_revalidate
  "This page redered at #{Time.now}"
end

get '/' do
  headers "Cache-Control" => "public, must-revalidate max-age=3600",
    "Expires" => Time.at(Time.now.to_i + (60*60)).to_s
  "This page redered at #{Time.now}."
end
