def general_request_method(request_method, path, &block)

  def erb(view_name)
    view = File.read("#{view_name.to_s}.erb")
    body = ERB.new(view)
    body.result(binding)
  end

  middleware = Class.new
  middleware.send(:define_method, 'initialize') do |app|
    @app = app
  end

  middleware.send(:define_method, 'call') do |env|
    request = Rack::Request.new(env)
    response = Rack::Response.new

    if request.request_method  == self.class.request_method && request.path_info == self.class.path
      response.write(action)
      response.finish
    else
     if @app.respond_to? :call
       @app.call(env)
     else
       [404, {"Content-Type" => "text/html"}, ["Not Found"]]
     end
    end
  end

  middleware.instance_eval do
    def path=(path)
      @path = path
    end

    def path
      @path
    end

    def request_method=(rm)
      @rm = rm
    end

    def request_method
      @rm
    end
  end

  middleware.send(:define_method, 'action', &block)
  middleware.path = path
  middleware.request_method = request_method

  use middleware
  middleware
end

def get(path, &block)
  general_request_method("GET", path, &block)
end

def post(path, &block)
  general_request_method("POST", path, &block)
end

def put(path, &block)
  general_request_method("PUT", path, &block)
end

def delete(path, &block)
  general_request_method("DELETE", path, &block)
end
