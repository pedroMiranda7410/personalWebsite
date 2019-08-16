class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :password_digest, null:false, default: ''
      t.string :name, null:false, default: ''
      t.string :nickname, null: false, default: ''
      t.string :email, null: false, default: ''
      t.boolean :admin, null: false, default: false
      t.timestamps
    end
  end
end
