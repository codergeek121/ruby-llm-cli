module CLAI
  module Commands
    class Chat
      def initialize(config)
        @config = config
      end

      def chat(prompt, persona: 'default')
        system_prompts = @config.personas.fetch(persona, [])
        HTTPClient.new(@config).chat(prompt, system_prompts: system_prompts)
      end
    end
  end
end
