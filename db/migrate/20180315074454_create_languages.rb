class CreateLanguages < ActiveRecord::Migration[5.1]
  def change
    create_table :languages do |t|
      t.integer :language
      t.timestamps
    end
  end
end
