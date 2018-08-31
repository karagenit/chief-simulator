require 'sqlite3'

class Database
  def initialize
    @db = SQLite3::Database.new 'chief.db'
  end

  def create
    @db.execute <<-SQL
      create table posts (
        id INTEGER PRIMARY KEY,
        text TEXT
      ) WITHOUT ROWID
    SQL
  end

  def delete
    @db.execute <<-SQL
      DROP TABLE IF EXISTS posts
    SQL
  end

  def get_last_post
  end

  def save_post(post)
    @db.execute "insert into posts (id, text) values (?, ?)", [post.id, post.text]
  end

  def get_post(post_id)
  end

  def post_exists?(post_id)
    @db.execute("SELECT EXISTS ( SELECT 1 FROM posts WHERE id=? )", [post_id]) == [[1]]
  end

  def get_post_contents
    @db.execute "select text from posts"
  end
end
