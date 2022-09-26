class AddTopicToComments < ActiveRecord::Migration[7.0]
  def change
    add_reference :comments, :topic, null: false, foreign_key: true
  end
end
