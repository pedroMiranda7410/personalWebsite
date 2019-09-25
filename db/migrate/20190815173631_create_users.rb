class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :password_digest, null:false, default: ''
      t.string :name, null:false, default: ''
      t.string :nickname, null: false, default: ''
      t.string :email, null: false, default: ''
      t.string :github, null:false, default: ''
      t.boolean :admin, null: false, default: false
      t.integer :login_count, null:false, default: 0
      t.integer :tamo_junto, null:false, default: 0
      t.integer :eu_quem_agradeco, null:false, default: 0
      t.boolean :first_time, null:false, default: true


      t.timestamps
    end
  end
end
