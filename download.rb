#!/usr/bin/env ruby

require_relative './database.rb'
require_relative './chief-delphi.rb'

db = Database.new

(1500000..1800000).each do |id|
  puts "Post #{id}..."
  begin
    post = download_post(id)
    db.save_post(post)
  rescue => error
    puts "Error Downloading/Saving Post #{id}: #{error.to_s.lines.first}"
  end
end

