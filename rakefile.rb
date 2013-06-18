$LOAD_PATH.unshift '.'

task :test do
  require 'test_helper'
  Dir.glob('*test.rb').each { |file| require File.expand_path(file) }
end
