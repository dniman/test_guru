class GistQuestionService

  def initialize(question)
    @question = question
    @test = question.test
  end

  def call
    client.create_gist(gist_params)
  end

  private

  def client
    @client ||= OctokitClient.new
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
end
