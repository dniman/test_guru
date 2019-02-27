class GitHubClient

  ROOT_ENDPOINT = 'https://api.github.com'
     
  def initialize
    @http_client = setup_http_client
  end
  
  def create_gist(params)
    response = @http_client.post('gists', params) do |request|
      request.headers['Authorization'] = "token #{ENV['ACCESS_TOKEN']}"
      request.headers['Content-Type'] = 'application/json'
      request.body = params.to_json
    end

    Response.new(response)
  end

  private

  def setup_http_client
    Faraday.new(url: ROOT_ENDPOINT)
  end
  
  class Response
    def initialize(response)
      @response = response
    end

    def success?
      @response.success?
    end

    def url
      JSON.parse(@response.body)["url"]
    end
  end

end
