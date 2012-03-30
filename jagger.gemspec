# -*- ruby -*-

Gem::Specification.new do |s|
  s.name              = 'jagger'
  s.rubyforge_project = 'jagger'
  s.version           = '0.0.1'

  s.authors           = ['Chris Kowalik']
  s.email             = ['chris@nu7hat.ch']
  s.homepage          = 'http://github.com/nu7hatch/jagger'
  s.summary           = 'Jagger is your frontman!'
  s.description       = <<-END
Jagger an frontman for your applications. It serves dynamically 
generated assets via sprockets pipeline, static files and all the 
templates. All that makes your life much easier.'
END

  s.files             = `git ls-files`.split("\n")
  s.test_files        = `git ls-files -- {spec}/*`.split("\n")
  s.require_paths     = ['lib']

  s.add_dependency 'sprockets'
  s.add_dependency 'sinatra'
  s.add_dependency 'rack'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'mocha'
end
