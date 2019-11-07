class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.string :title, null:false, default: ""
      t.string :sub_title, null:false, default: ""
      t.string :objective, null:false, default: ""
      t.string :sub_description, null:false, default: ""
      t.string :description, null:false, default: ""
      t.string :language, null:false, default: ""
      t.string :principal_language, null:false, default: ""
      t.string :pdf, null:false, default: ""
      t.string :readme, null:false, default: ""
      t.string :video, null:false, default: ""
      t.string :image, null:false, default: ""
      t.string :summary_file_zip, null:false, default: ""
      t.string :github_repo_name, null:false, default: ""
      t.string :github_owner_name, null:false, default: ""
      t.string :github_branch_name, null:false, default: "master"
      t.boolean :admin_verification, null: false, default: false
      t.boolean :get_from_github, null: false, default: false
      t.attachment :files_zip
      t.boolean :principal, null:false, default: false
      t.integer :likes, null:false, default: 0

      t.timestamps
    end
  end
end
