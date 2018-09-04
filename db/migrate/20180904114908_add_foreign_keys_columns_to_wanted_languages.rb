class AddForeignKeysColumnsToWantedLanguages < ActiveRecord::Migration[5.2]
  def change
    add_reference :wanted_languages, :user, foreign_key: true
    add_reference :wanted_languages, :language, foreign_key: true
  end
end
