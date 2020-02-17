class CreateRequests < ActiveRecord::Migration[6.0]
  def change
    create_table :requests do |t|
      t.string :type_request
      t.references :user, foreign_key: true
      t.references :article,  foreign_key: true
      t.references :comment, foreign_key: true
      t.timestamps
    end
  end
end