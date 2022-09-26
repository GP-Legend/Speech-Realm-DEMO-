class AddUsernameToTopics < ActiveRecord::Migration[7.0]
  def change
    add_column :topics, :username, :string
  end
end
