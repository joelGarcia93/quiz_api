class CreateAnswers < ActiveRecord::Migration[6.1]
  def change
    create_table :answers do |t|
      t.references :question, foreign_key: true, null: false
      t.string :name, null: false
      t.boolean :is_correct, null: false, default: false
      t.index [:name, :question_id], unique: true
      t.timestamps
    end
  end
end
