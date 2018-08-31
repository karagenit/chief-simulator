require 'open-uri'
require 'nokogiri'

class Post
  attr_reader :id, :text, :created, :thread_id, :user_id, :forum_id

  def initialize(id, text, created = nil, thread_id = nil, user_id = nil, forum_id = nil)
    @id = id
    @text = text
    @created = created
    @thread_id = thread_id
    @user_id = user_id
    @forum_id = forum_id
  end
end

# TODO: fetch user, forum, thread
def download_post(post_id)
  doc = Nokogiri::HTML(open("https://www.chiefdelphi.com/forums/showpost.php?p=#{post_id}"))
  message = doc.at_css("[id=\"post_message_#{post_id}\"]")
  message.css('table').remove
  message.css('div').remove
  message.css('br').remove
  text = message.text
  text.gsub!(/\s+/, ' ')
  Post.new(post_id, text)
end

