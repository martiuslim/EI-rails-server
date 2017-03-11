class CreateCriminals < ActiveRecord::Migration
  def change
    create_table :criminals do |t|
      t.string :name
      t.string :ic, null: false
      t.string :offence
    end
  end
end
