#!/usr/bin/env ruby

require_relative './database.rb'
require_relative './chief-delphi.rb'

db = Database.new

(1500000..1800000).each do |id|
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

