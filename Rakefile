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
    db = Database.new
    start_cnt = (ENV['start'] || (db.get_last_id + 1)).to_i
    end_cnt = (ENV['end'] || 1800000).to_i
    thread_cnt = (ENV['threads'] || 8).to_i

    threads = (0...thread_cnt).map do |offset|
        Thread.new do
            ((start_cnt + offset)..end_cnt).step(thread_cnt) do |id|
                begin
                    if db.post_exists? id
                        print "Skipping Post #{id}\n"
                        next
                    end
                    post = download_post(id)
                    db.save_post(post)
                    print "Saved Post #{id}\n"
                rescue => error
                    print "Error Downloading/Saving Post #{id}: #{error.to_s.lines.first}\n"
                end
            end
        end
    end
    threads.map(&:join)
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
