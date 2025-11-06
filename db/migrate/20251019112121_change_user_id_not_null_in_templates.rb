class ChangeUserIdNotNullInTemplates < ActiveRecord::Migration[8.0]
  def change
    change_column_null :templates, :user_id, false
  end
end