class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, null:false, default: ""
      t.string :objective, null:false, default: ""
      t.string :description, null:false, default: ""
      t.string :language, null:false, default: ""
      t.string :pdf, null:false, default: ""
      t.string :readme, null:false, default: ""
      t.string :video, null:false, default: ""
      t.string :photo, null:false, default: ""
      t.string :summary_file_zip, null:false, default: ""
      t.string :github_link, null:false, default: ""
      t.boolean :admin_verification, null: false, default: false
      t.attachment :files_zip

      t.timestamps
    end
  end
end
