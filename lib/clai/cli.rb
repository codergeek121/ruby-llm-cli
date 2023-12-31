module CLAI
  class CLI < Thor
    default_task :session

    option :persona, type: :string
    desc "session", "Start an interactive chat session"
    long_desc <<~DESC
    Starts a REPL like chat process

    > $ clai session

    Use a preconfigured persona with --persona

    > $ clai chat "Count to 10" --persona ruby
    DESC
    def session
      Commands::Session.new(config).start_session(persona: options['persona'])
    end

    option :persona, type: :string
    desc "chat", "Prompt on the terminal"
    long_desc <<~DESC
    Send a single prompt to AI

    > $ clai chat "Tell me a short story!"

    Use a preconfigured persona with --persona

    > $ clai chat "Count to 10" --persona ruby
    DESC
    def chat(prompt)
      Commands::Chat.new(config).chat(prompt, persona: options['persona'])
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
