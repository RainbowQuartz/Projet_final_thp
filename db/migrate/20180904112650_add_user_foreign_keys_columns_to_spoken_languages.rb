class AddUserForeignKeysColumnsToSpokenLanguages < ActiveRecord::Migration[5.2]
  def change
    add_reference :spoken_languages, :user, foreign_key: true
    add_reference :spoken_languages, :language, foreign_key: true
  end
end
