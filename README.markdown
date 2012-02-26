# UnderRack

A simple Ruby Framework for you understand Rack(Ruby Webserver Interface)

## Example

* gem install under_rack
* create a new file called app.ru with:

`
    require "rubygems"
    require "under_rack"

    get "/hello" do
      @name = "Mary"
      erb :hello
    end

    post "/create" do
      "Created"
    end

    app_root = get "/" do
     "Home"
    end

    run app_root

* create a new file called hello.erb with:

    `<p>Hello <%= @name %></p>`

* Run the application with: rackup app.ru

* Go to http://localhost:9292/hello
