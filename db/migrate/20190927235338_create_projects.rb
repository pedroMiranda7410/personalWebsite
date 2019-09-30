class CreateProjects < ActiveRecord::Migration[5.2]
  def change
    create_table :projects do |t|
      t.string :title, null:false, default: ""
      t.string :objective, null:false, default: ""
      t.string :description, null:false, default: ""
      t.string :language, null:false, default: ""
      t.string :pdf, null:false, default: ""
      t.string :readme, null:false, default: ""
      t.string :video, null:false, default: ""
      t.string :photo, null:false, default: ""
      t.string :summary_file_zip, null:false, default: ""
      t.attachment :files_zip
      t.string :github_link, null:false, default: ""
      t.boolean :principal, null:false, default: false

      t.timestamps
    end
  end
end
