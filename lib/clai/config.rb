module CLAI
  class Config
    def self.parse
      config = YAML.safe_load_file(CLAI.config_file_path)
      new(
        api_key: config["api_key"],
        model: config["model"],
        personas: config["personas"]
      )
    rescue Errno::ENOENT
      puts S.(:no_clai_yml)
      exit(false)
    end

    attr_reader :api_key, :model, :personas

    def initialize(api_key:, model:, personas:)
      @api_key = api_key
      @model = model
      @personas = personas
    end
  end
end
