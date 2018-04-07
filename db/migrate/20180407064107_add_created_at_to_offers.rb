class AddCreatedAtToOffers < ActiveRecord::Migration[5.1]
  def change
    require"date"
   add_column :Offers, :created_at, :daytimes
  end
end
