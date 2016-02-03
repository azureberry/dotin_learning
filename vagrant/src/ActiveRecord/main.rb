require 'active_record'
require 'logger'

### 接続
ActiveRecord::Base.establish_connection(
    "adapter" => "sqlite3"
    "database" => "./blog.db"
)

# この指定だけで、ログが出力される
ActiveRecord::Base.logger = Logger.new(STDOUT)

class Post < ActiveRecord::Base  #Post 自動
    scope :top3, order("created_at").limit(3)  # scopeの定義 =>
end

### 挿入

# post = Post.new(:title => "test1", :body => "hello1")

# post = Post.new
# p.title = "test2"
# p.body = "hello2"

Post.new do |p|
    p.title = "test3"
    p.body = "hello3"
end

post.save

Post.create(:title => "test4", :body => "hello4")  # new + save

# 抽出結果がなかったら、レコードを新規作成
Post.where(:title => "test5").first_or_create do |p|
    p.body = "hello5"
end

###抽出
Post.all
Post.first.title
Post.find_by_title("test2")
Post.find_by_title_and_id("test3", 3)

Post.where(:title => "test1", :id => 1)
Post.where("title = ? and id = ?", "title2", 2)
Post.where("title = :title and id = :id", {:title => "title1", :id => "1"})

Post.where(:id => 1..3)
Post.where(:id => [1, 3])

Post.order("id desc").limit(3)
Post.top3  # => scopeの利用
