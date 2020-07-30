class AddImageIdToComments < ActiveRecord::Migration[6.0]
  def change
    add_reference :comments, :image, null: true, foreign_key: true
  end
end
