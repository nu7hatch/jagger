require 'sinatra/base'

module Jagger
  # Internal: App is a Sinatra application used to serve static
  # files and index, and to keep Jagger's configuration. 
  class App < Sinatra::Application
    set :asset_paths, %w(src/main/ src/test/ src/look/ lib/)
    set :public_folder, 'static'
    set :views, 'templates'
    set :layout, false

    helpers do
      # Public: Returns whether requests' mocks should be skipped
      # or not. 
      def mock_requests?
        ENV['USE_REAL_REQUESTS'].to_i == 0
      end
    end

    get '/' do
      erb :index
    end
  end
end
