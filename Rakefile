require_relative './database.rb'

task :irb do
    sh 'irb -r "./chief-delphi.rb" -r "./database.rb"'
end

task :reset_db do
    db = Database.new
    db.delete
    db.create
end
