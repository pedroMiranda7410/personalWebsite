class CreateMyObjectives < ActiveRecord::Migration[5.2]
  def change
    create_table :my_objectives do |t|
      t.string :description, null:false, default: ""
      t.timestamps
    end
  end
end
