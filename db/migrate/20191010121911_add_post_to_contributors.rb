class AddPostToContributors < ActiveRecord::Migration[5.2]
  def change
    add_reference :contributors, :post, foreign_key: true
  end
end
