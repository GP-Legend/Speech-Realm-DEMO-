class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.string :name
      t.text :body
      
      t.timestamps
    end

    #Didn't proofread the code! Violates DRY ==> add_index :comments, :username
    remove_column: :comments, :username
  end
end
