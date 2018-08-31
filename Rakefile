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

task :generate do # rake generate count=3
    num = ENV['count'] || 5
    chain = MarkovPolo::Chain.new
    db = Database.new
    db.get_post_contents.each { |post| chain.push post[0] }
    num.times do
        puts chain.generate
    end
end
