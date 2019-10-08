class CreateCoolPhrases < ActiveRecord::Migration[5.2]
  def change
    create_table :cool_phrases do |t|
      t.string :phrase, null: false, default: ""
      t.timestamps
    end
  end
end
