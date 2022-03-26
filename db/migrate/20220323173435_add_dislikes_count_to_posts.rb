class AddDislikesCountToPosts < ActiveRecord::Migration[7.0]
  def change
    add_column :posts, :dislikes_count, :integer, default: 0, null: false
  end
end
