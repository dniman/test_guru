class GitHubClient

  ROOT_ENDPOINT = 'https://api.github.com'
  ACCESS_TOKEN = '642a60c06233a0b542863c0f8776899233d56b1c'
     
  def initialize
    @http_client = setup_http_client
  end
  
  def create_gist(params)
    @http_client.post('gists', params) do |request|
      request.headers['Authorization'] = "token #{ACCESS_TOKEN}"
      request.headers['Content-Type'] = 'application/json'
      request.body = params.to_json
    end
  end

  private

  def setup_http_client
    Faraday.new(url: ROOT_ENDPOINT)
  end

end
