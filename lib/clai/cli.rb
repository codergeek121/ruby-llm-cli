module CLAI
  class CLI < Thor
    default_task :session

    desc "session", "Start an interactive chat session"
    long_desc <<~DESC
    Starts a REPL like chat process

    > $ clai session
    DESC
    def session
      Commands::Session.new(config).start_session
    end

    desc "chat", "Prompt on the terminal"
    long_desc <<~DESC
    Send a single prompt to AI

    > $ clai chat "Tell me a short story!"
    DESC
    def chat(prompt)
      Commands::Chat.new(config).chat(prompt)
    end

    option :force, type: :boolean, default: false
    desc "setup", "Setup clai on your machine"
    long_desc <<~DESC
    Setup `clai` on your machine. This will ask you for a api key and create a base config file.

    > $ clai setup
    DESC
    def setup
      Commands::Setup.new.run(options[:force])
    end

    private

    def config
      @config ||= Config.parse
    end
  end
end
