class CreatePosts < ActiveRecord::Migration[5.0]
  def change
    create_table :posts do |t|
      t.string  :title
      t.text    :body
      t.string  :slug, index: true
      t.integer :user_id, index: true
      t.string  :author_name

      t.timestamps
    end
  end
end
