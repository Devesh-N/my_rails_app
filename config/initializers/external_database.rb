EXTERNAL_DB = YAML::load(ERB.new(File.read(Rails.root.join("config/database.yml"))).result)["external_database"]
