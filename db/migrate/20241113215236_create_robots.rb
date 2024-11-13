class CreateRobots < ActiveRecord::Migration[7.0]
  def change
    create_table :robots do |t|
      t.string :site_name
      t.string :site_id
      t.string :robot_id
      t.string :display_name
      t.string :type

      t.timestamps
    end
  end
end
