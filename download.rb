#!/usr/bin/env ruby

require 'database'
require 'chief-delphi'

db = Database.new

last_id = db.get_last_post
id = last_id.to_i + 1

loop do
  begin
    post = download_post(id)
    db.save_post(post)
  rescue
    puts "Error Downloading/Saving Post #{id}"
  end
  id += 1
end

