class CreateArticles < ActiveRecord::Migration[7.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.text :body

      t.timestamps
    end
  end
end
#bin/rails console
#article = Article.new(title: "Hello Rails", body: "I am on Rails!")
#irb> article.save
#irb> article
#irb> Article.find(1)
#irb> Article.all