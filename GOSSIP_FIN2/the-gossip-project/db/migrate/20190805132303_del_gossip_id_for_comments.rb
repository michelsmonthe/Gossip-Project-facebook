class DelGossipIdForComments < ActiveRecord::Migration[5.2]
  def change
    change_table :comments do |t|
      t.remove :gossip_id
    end
  end
end
