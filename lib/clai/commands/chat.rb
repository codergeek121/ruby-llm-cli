module CLAI
  module Commands
    class Chat
      def initialize(config)
        @config = config
      end

      def chat(prompt)
        HTTPClient.new(@config).chat(prompt)
      end
    end
  end
end
