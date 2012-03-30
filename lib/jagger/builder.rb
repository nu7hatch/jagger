module Jagger
  # Public: Builder creates rack compatible application which gathers
  # and serves static sinatra app and sprockets pipeline together.
  #
  # Example
  #
  #   app = Jagger::Builder.new do
  #     set :asset_paths, %w(src/main/ src/test/ src/look/ lib/)
  #     set :views, 'templates'
  #     set :public_folder, 'static'
  #   end
  #
  #   run app
  #
  # Configuration above is the default one, so in most of cases only
  # the following declaration will be enough:
  #
  #   run Jagger::Builder.new
  #
  class Builder
    # Public: Constructor. Initializes application and the assets 
    # pipeline. Passed block accepts custom configuration.
    def initialize(&block)
      app.instance_eval(&block) if block_given?
      assets.append_paths(app.asset_paths)
    end

    # Internal: Sinatra application used to serve static files and
    # index page.
    def app
      @app ||= App
    end
    
    # Internal: Assets pipeline environment.
    def assets
      @assets ||= Assets.new
    end

    # Public: Serves the application and assets pipeline together
    # as one rack application.
    #
    # env - The Hash with request environment.
    #
    def call(env)
      map = {
        '/assets' => assets,
        '/'       => app.new,
      }
      router = Rack::URLMap.new(map)
      router.call(env)
    end
  end
end
