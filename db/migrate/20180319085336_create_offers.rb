class CreateOffers < ActiveRecord::Migration[5.1]
  def change
    create_table :offers do |t|

      t.integer :user_id
      t.string :country
      t.string :state
      t.string :region
      t.date :period_from
      t.date :period_to
      t.string :title
      t.string :detail
      t.string :offer_image
      t.datetime :created_at 

      t.timestamps
    end
  end
end
