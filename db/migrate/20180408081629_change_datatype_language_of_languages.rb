class ChangeDatatypeLanguageOfLanguages < ActiveRecord::Migration[5.1]
  def change
    change_column :languages, :language, :integer
  end
end
