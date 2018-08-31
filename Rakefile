require_relative './chief-delphi.rb'
require_relative './database.rb'

require 'marky_markov'
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

task :download do
    start = (ENV['start'] || 1509124).to_i
    end_cnt = (ENV['end'] || 1800000).to_i
    db = Database.new

    (start..end_cnt).each do |id|
        begin
            if db.post_exists? id
                puts "Skipping Post #{id}"
                next
            end
            # TODO: add timeout to downloading?
            post = download_post(id)
            db.save_post(post)
            puts "Saved Post #{id}"
        rescue => error
            # TODO: still enter into DB with null message?
            puts "Error Downloading/Saving Post #{id}: #{error.to_s.lines.first}"
        end
    end
end

task :generate do # rake generate count=3
    num = (ENV['count'] || 5).to_i
    chain = MarkyMarkov::TemporaryDictionary.new(3)
    db = Database.new
    db.get_post_contents.each { |post| chain.parse_string post[0] }
    num.times do
        puts chain.generate_1_sentences
        puts ''
    end
end
