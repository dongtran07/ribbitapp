class CreateRelationships < ActiveRecord::Migration
  def change
    create_table :relationships do |t|
      t.integer :flower_id
      t.integer :flowed_id

      t.timestamps
    end
  end
end
