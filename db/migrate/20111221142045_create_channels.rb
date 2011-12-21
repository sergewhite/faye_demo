class CreateChannels < ActiveRecord::Migration
  def self.up
    create_table :channels do |t|
      t.string :title
      t.integer :current_users_count
      t.text :current_users

      t.timestamps
    end
  end

  def self.down
    drop_table :channels
  end
end
