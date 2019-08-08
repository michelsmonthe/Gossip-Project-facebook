class CreatePrivateMessages < ActiveRecord::Migration[5.2]
  def change
    create_table :private_messages do |t|
      t.text :content
      t.belongs_to :from, class_name: 'User'
      t.belongs_to :to, class_name: 'User'
      t.timestamps
    end
  end
end
