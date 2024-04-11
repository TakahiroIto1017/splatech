class ChangeConstraintInTableName < ActiveRecord::Migration[7.0]
  def change
    change_column_null :users, :profile, true
    change_column_null :users, :policy_id, true
    change_column_null :users, :skill_id, true
    change_column_null :users, :xp, true
    change_column_null :users, :background_id, true
  end
end
