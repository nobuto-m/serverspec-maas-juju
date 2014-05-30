require 'rake'
require 'rspec/core/rake_task'
require 'yaml'

properties = YAML.load_file('properties.yml')

desc "Run serverspec to all hosts"
task :spec => 'serverspec:all'

namespace :serverspec do
  properties.keys.each do |key|
    task :all => properties[key][:hosts].map {|host| 'serverspec:' + host.split('.')[0] }
    properties[key][:hosts].each do |host|
      desc "Run serverspec to #{host}"
      RSpec::Core::RakeTask.new(host.split('.')[0].to_sym) do |t|
        ENV['TARGET_HOST'] = host
        t.pattern = 'spec/{' + properties[key][:roles].join(',') + '}/*_spec.rb'
      end
    end
  end
end
