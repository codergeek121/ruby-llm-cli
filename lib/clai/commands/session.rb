module CLAI
  module Commands
    class Session
      def initialize(config)
        @config = config
      end

      def start_session
        loop do
          print S.(:prompt)
          question = $stdin.gets
          break unless question
          HTTPClient.new(@config).chat(question.strip)
          puts
        end
      end
    end
  end
end
