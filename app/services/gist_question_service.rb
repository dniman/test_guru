class GistQuestionService

  def initialize(question)
    @question = question
    @test = question.test
  end

  def call
    begin
      client.create_gist(gist_params)
    rescue Exception => e
      Rails.logger << "#{e.message}"
    end
    
    Response.new(client.last_response)
  end

  private

  def client
    @client ||= Octokit::Client.new(access_token: ENV['ACCESS_TOKEN'])
  end

  def gist_params
    {
      description: I18n.t("services.description", title: @test.title),
      files: {
        'test-guru-question.txt': {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [ @question.body ]
    content += @question.answers.pluck(:body)
    content.join("\n")
  end
  
  class Response
    
    def initialize(response)
      @response = response
    end

    def success?
      !!@response
    end

    def url
      @response.data[:url]
    end
  end
end
