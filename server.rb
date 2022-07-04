require 'sinatra'
require "sinatra/reloader" if development?

def loading_pictures
    Dir.glob("public/Pictures/*.{jpeg, JPEG}")
end

# get "/" do
#     "Hi, visitor, nice to meet you!"
# end

get "/cat" do
    @pictures = loading_pictures
    erb :image
end

get "/:name?" do |name|
    erb :index, :locals => {:name=>name}
    # "Hi, #{name.capitalize}, nice to meet you!"
end
