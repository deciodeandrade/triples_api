class CreateIncidents < ActiveRecord::Migration[7.0]
  def change
    create_table :incidents do |t|
      t.string :robot
      t.string :treatment_id
      t.string :status
      t.string :recovery
      t.datetime :date_time
      t.float :percentage
      t.string :error_code

      t.timestamps
    end
  end
end
