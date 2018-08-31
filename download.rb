#!/usr/bin/env ruby

require 'database'
require 'chief-delphi'

db = Database.new

(1500000..1800000).each do |id|
  begin
    post = download_post(id)
    db.save_post(post)
  rescue => error
    puts "Error Downloading/Saving Post #{id}: #{error.lines.first}"
  end
end

