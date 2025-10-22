class AddContentToTemplates < ActiveRecord::Migration[8.0]
  def change
    add_column :templates, :content, :text
  end
end
