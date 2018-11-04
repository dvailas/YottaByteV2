class RenameUserToUserid < ActiveRecord::Migration[5.2]
  def change
    rename_column(:purchases, :purchasedby_id, :user_id)
  end
end
