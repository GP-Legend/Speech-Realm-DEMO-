class CreateTopics < ActiveRecord::Migration[7.0]
  def change
    create_table :topics do |t|
      t.string :title
      t.text :body

      t.timestamps
    end

    add_index :topics, :username
  end
end
