module CLAI
  module Commands
    class Setup
      def run(force)
        if clai_setup? && !force
          puts S.(:already_setup)
        else
          generate_config_directory
          ask_for_open_ai_api_key
          generate_sample_config_file
        end
      end

      private

      def clai_setup?
        File.exist?(File.expand_path("~/.config/clai/clai.yml"))
      end

      def ask_for_open_ai_api_key
        puts S.(:disclaimer)
        print S.(:paste_key)
        input = $stdin.gets.strip
        if input.length > 0
          @api_key = input
        else
          @api_key = "<No API key specified>"
        end
      end

      def generate_config_directory
        FileUtils.mkdir_p(File.expand_path("~/.config/clai"))
      end

      def generate_sample_config_file
        File.write(CLAI.config_file_path, sample_config)
      end

      # TODO: use erubis and move to /strings and rename /strings
      def sample_config
        <<~YML
          # Read more about the clai.yml config file at https://github.com/codergeek121/clai/docs/setup.md
          api_key: #{@api_key}
          model: gpt-3.5-turbo
          personas:
            default:
              - You are a helpful assistant
              - You answers are formatted in markdown
            ruby:
              - You are a ruby programmer
              - You do not comment your code
        YML
      end
    end
  end
end
