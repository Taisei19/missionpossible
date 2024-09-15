require 'openai'

class ImageGenerationService
  def self.generate_image(goal)
    client = OpenAI::Client.new(access_token: ENV['OPENAI_API_KEY'])

    # goalに基づいてプロンプトを作成
    prompt = "A person happily studying math for the goal: #{goal}"

    # DALL·E APIを呼び出して画像を生成
    response = client.images.generate(prompt: prompt, n: 1, size: "1024x1024")

    if response && response['data'] && response['data'][0] && response['data'][0]['url']
      response['data'][0]['url']
    else
      nil
    end
  rescue => e
    Rails.logger.error "Error generating image: #{e.message}"
    
  end

end