class AddisrequestId < ActiveRecord::Migration[6.0]
  def change
    change_table(:articles) do |t|
      add_column :articles, :isrequested, :boolean
      add_index :articles, :isrequested
    end
  end
end
