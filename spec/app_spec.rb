require File.dirname(__FILE__) + "/spec_helper"

describe "UnderRack" do
  let(:app) do
    Rack::Builder.new do
      get "/hello" do
        "GET hello"
      end

      post "/hello" do
        "POST hello"
      end

      put "/hello" do
        "PUT hello"
      end

      delete "/hello" do
        "DELETE hello"
      end

      root_app = get "/" do
        "GET root"
      end

      run root_app
    end
  end

  before :each do
    @mock = Rack::MockRequest.new(app)
  end

  describe "GET /hello" do
    it "returns a response body with 'GET hello'" do
      @mock.get("/hello").body.should eql "GET hello"
    end
  end

  describe "POST /hello" do
    it "returns a response body with 'POST hello'" do
      @mock.post("/hello").body.should eql "POST hello"
    end
  end

  describe "PUT /hello" do
    it "returns a response body with 'PUT hello'" do
      @mock.put("/hello").body.should eql "PUT hello"
    end
  end

  describe "DELETE /hello" do
    it "returns a response body with 'DELETE hello'" do
      @mock.delete("/hello").body.should eql "DELETE hello"
    end
  end
end
