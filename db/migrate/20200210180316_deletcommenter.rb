class Deletcommenter < ActiveRecord::Migration[6.0]
  def change
    remove_column :comments, :commenter, :string
  end
end
