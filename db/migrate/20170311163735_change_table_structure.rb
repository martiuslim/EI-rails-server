class ChangeTableStructure < ActiveRecord::Migration[5.0]
  def change
    drop_table :criminals
    create_table :criminals do |t|
      t.string :name
      t.string :ic, null: false
      t.index :ic
      t.string :offence
    end
  end
end
