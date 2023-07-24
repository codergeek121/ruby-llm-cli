module CLAI
  class HTTPClient
    def initialize(config)
      @config = config
    end
  
    def chat(query, system_prompts: [])
      system_prompts = system_prompts.map { |prompt| { role: :system, content: prompt } }
      puts
      client
        .post("https://api.openai.com/v1/chat/completions",
          json: {
            model: @config.model,
            messages: [
              *system_prompts,
              { "role": "user", "content": query },
            ],
            stream: true
          }
        ).body.each_with_index do |chunk, i|
          if i == 0
            # TODO: remove workaround
            splits = chunk.split("\n\n")
            if splits.length > 1
              chunk = splits[1]
            else
              chunk = splits[0]
            end
          end
          data = chunk.match(/data: (.*)/) || []

          break if data[1] == "[DONE]"

          if data[1] 
            result = JSON.parse(data[1])
            print result.dig('choices', 0, "delta", "content")
          end
        end
        puts
    end
  
    private
  
    def client
      HTTP
        .auth("Bearer #{@config.api_key}")
        .headers(accept: "application/json")
    end
  end
end
