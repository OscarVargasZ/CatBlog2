class AddAasmStateToArticles < ActiveRecord::Migration[6.0]
  def change
    add_column :articles, :aasm_state, :string
  end
end
