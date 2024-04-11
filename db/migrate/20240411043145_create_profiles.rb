class CreateProfiles < ActiveRecord::Migration[7.0]
  def change
    create_table :profiles do |t|
      t.string :name, null: false
      t.text :profile
      t.integer :policy_id
      t.integer :skill_id
      t.integer :xp
      t.integer :background_id
      t.timestamps
    end
  end
end
