class CreateClientAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :client_answers do |t|
      t.references :client, foreign_key: true, null: false
      t.references :answer, foreign_key: true, null: true
      t.timestamps
    end
  end
end
