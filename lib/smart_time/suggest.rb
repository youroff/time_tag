require 'yaml'

module SmartTime
  class Suggest

    def self.by(q)
      new.options.select {|item| item =~ /^#{q}/i}
    end
    
    def options
      @@options ||= rec_flat dict
    end
    
    private
    def dict
      @@dict ||= YAML::load_file File.join(File.expand_path('../../dicts', __dir__), 'dict.yml')
    end
    
    def rec_flat hash
      hash.inject([]) do |acc, v|
        (v.last.is_a? Hash) ? acc | rec_flat(v.last) : acc | v.last.split("|")
      end.sort
    end
  end
end
