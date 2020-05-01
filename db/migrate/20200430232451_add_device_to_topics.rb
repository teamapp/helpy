class AddDeviceToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :device, :string
  end
end
