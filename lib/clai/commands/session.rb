module CLAI
  module Commands
    class Session
      def initialize(config)
        @config = config
      end

      def start_session(persona: 'default')
        system_prompts = @config.personas.fetch(persona, [])
        loop do
          print S.(:prompt)
          question = $stdin.gets
          break unless question
          HTTPClient.new(@config).chat(question.strip, system_prompts: system_prompts)
          puts
        end
      end
    end
  end
end
