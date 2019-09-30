class CreateContributors < ActiveRecord::Migration[5.2]
  def change
    create_table :contributors do |t|
      t.string :github, null:false, default: ""
      t.string :user_d, null:false, default: 0
      t.timestamps
    end
  end
end
