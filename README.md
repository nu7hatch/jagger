# Jagger is your frontman!

![Mick Jagger](http://i.imgur.com/xW8XW.jpg)

Jagger is a frontman for your frontend application. Mixing frontend and
backend in one Rails applicaiton sucks, let's say it stright! We have
bunch of unrelated things mixed together, why? With Jagger you gonna
rock your frontend application management!

## Philosophy

Backend and frontend of web application are in fact two different 
applications, ususaly utilizing different languages and tools.
The main point of Jagger's philosophy is to split backend and
frontend into separated applications.

**Frontend** - ususally a JavaScript (eg. Backbone) application 
with set of templates and GUI integration tests.

**Backend** - an app written with Sinatra, Rails or whatever else,
which provices an unified API required by the _Frontend_ app.

## Controversy

_Are you insane? I have to write two apps instead of one, and everytime
I change something in the backend then I have to adjust frontend one?_

Um... Well, you do the same every single day. You change something in
your Rails model, then you going to the view and editing it, then you
going to the (Java|Coffee)Script part and keep adjusting to the changes
you made in the model.

**The biggest advantages of this layout**:

* Frontend people can work on frontend without dealing with overwhelming
  backend code.
* Backend people may don't give a shit about frontend stuff.
* Application has unified API which can be reused further by other
  views (iPhone or Android app, external consumers, etc.)
* Frontend may be written totally without thinking about the databases
  and other delivery methods. It can focus only on the look and feel
  by accessing all the data from mocks.
* It's briliant for the designers, thus they don't need to install all
  the development stuff (usually, you have to install it for them).
* After all, you can serve everything as one application anyway...

**This layout also have disadvantages**:

* It has no server side generated views - so it is not well suitable
  for the applications which tend to be crawlable eg. by Googlebot.
* It requires good communication in your team in case of defining
  and maintaining the API. Hmm, if you improve your communication thanks
  to this then it may be considered as an advantage.
* It forces you to think different and abstract... some people don't like
  this :P

## Installation

Like always, via rubygems:

    $ gem install jagger
    
Or by adding dependency to your gemfile:

    gem 'jagger'
    
## Usage

Jagger comes with set of conventions to make your life easier. Here's
the frontend app directory structure:

    + your_frontend/
    |-- lib/                - External, static JavaScript libraries (eg. jQuery).
    |-+ src/                - Dynamic sources.
    | |-- styles/           - Your CSS, SASS, LESS or God knows what styles.
    | |-- sprites/          - Source images for your sprites.
    | |-- main/             - Your application's (Java|Coffee)Script files.
    | |-- test/             - Your GUI test files (i.a. QUnit, Selenium).
    |-- static/             - Static images, javascripts, fonts, etc.
    |-- templates/          - All the template files.
    |-- config.ru           - Rack configuration.

You can set ther up a Gemfile with `jagger` listed as a dependency and
add this code to `config.ru`

    # *snip*

    run Jagger::Builder.new
    
If you want to mount it within your backend application, no problem!
You can do it this way:

    # *snip*
    
    map '/api' do
      run MyBackendApp.new
    end
    
    map '/' do
      run Jagger::Builder.new
    end

You can serve your frontend app simply like any other rack app using
`thin`, `rackup` or whatever you want. 
