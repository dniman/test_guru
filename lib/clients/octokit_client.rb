class OctokitClient

  def create_gist(params)
    begin
      client.create_gist(params)
    rescue Exception => e
      Rails.logger << "#{e.message}"
    end
    
    Response.new(client.last_response)
  end

  def client
    @client ||= Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  end

  class Response
    
    def initialize(response)
      @response = response
    end

    def success?
      !!@response
    end
  end
end
