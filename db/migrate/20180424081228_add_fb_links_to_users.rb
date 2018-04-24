class AddFbLinksToUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :Fb_link, :string
  end
end
