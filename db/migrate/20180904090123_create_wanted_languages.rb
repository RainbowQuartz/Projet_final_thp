class CreateWantedLanguages < ActiveRecord::Migration[5.2]
  def change
    create_table :wanted_languages do |t|

      t.timestamps
    end
  end
end
