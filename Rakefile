require_relative './database.rb'

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
