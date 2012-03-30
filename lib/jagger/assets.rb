require 'sprockets'

module Jagger
  # Internal: Assets serves all dynamically generated asssets 
  # through sprockets pipeline.
  class Assets
    # Public: Constructor. Initializes sprockets environment.
    def initialize
      @sprockets = Sprockets::Environment.new
    end

    # Public: Registers given load paths in sprockets' env.
    #
    # dir - The Array of dirs to register
    #
    def append_paths(dirs = [])
      dirs.each { |dir| @sprockets.append_path(dir) }
    end

    # Public: Serves assets
    #
    # env - The Hash HTTP environment.
    #
    # Returns HTTP response data.
    def call(env)
      @sprockets.call(env)
    end
  end
end
