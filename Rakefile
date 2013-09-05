#!/usr/bin/env rake

thisdir = Pathname.new(File.dirname(__FILE__)).realpath

task :environment do
  require (thisdir + 'environment.rb')
end

namespace :test do
  desc 'run functional tests'
  task :functionals => :environment do 
    ruby thisdir.join('test', 'functional', '*_test.rb')
  end
end