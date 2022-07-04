ENV['APP_ENV'] = 'test'

require_relative '../server.rb'
require 'rack/test'

RSpec.describe 'test' do
    include Rack::Test::Methods

    def app
        Sinatra::Application
    end

    it 'returns visitor when root is /' do
        get '/'
        expect(last_response).to be_ok
        expect(last_response.body).to include('visitor')
    end
    it 'returns name passed as parameter within body' do
        get "/tim"
        expect(last_response).to be_ok
        expect(last_response.body).to include("Tim")
    end
end