class AddActivedbyId < ActiveRecord::Migration[6.0]
  def change
    change_table(:articles) do |t|
      t.references :actived, foreign_key: { to_table: 'users' }
    end
  end
end
