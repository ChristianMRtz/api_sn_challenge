class DeleteColumnCommentIdToLikes < ActiveRecord::Migration[7.0]
  def change
    remove_column :likes, :comment_id
  end
end
