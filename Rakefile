require_relative './database.rb'

require 'markov-polo'
require 'json'

task :irb do
    sh 'irb -r "./chief-delphi.rb" -r "./database.rb"'
end

task :reset_db do
    db = Database.new
    db.delete
    db.create
end

task :dump_db do
    db = Database.new
    db.get_post_contents.each do |post|
        message = post[0]
        puts "#{message[0..40]}..."
    end
end

task :train do
    file = ENV['file'] || 'model.json' # set via 'rake train file=name'
    chain = MarkovPolo::Chain.new
    db = Database.new
    db.get_post_contents.each { |post| chain.push post[0] }
    File.write(file, chain.to_h.to_json)
end

task :generate do
    file = ENV['file'] || 'model.json'
    chain = MarkovPolo::Chain.new(JSON.parse(File.read(file)))
    puts chain.generate
end
