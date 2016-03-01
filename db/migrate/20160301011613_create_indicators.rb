class CreateIndicators < ActiveRecord::Migration
  def change
    create_table :indicators do |t|
      t.int :competency_id
      t.string :level
      t.string :description

      t.timestamps
    end
  end
end
