class ChangeColumnName < ActiveRecord::Migration[7.0]
  def change
    rename_column :comments, :body, :body_comment
  end
end
