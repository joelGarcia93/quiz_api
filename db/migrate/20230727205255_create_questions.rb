class CreateQuestions < ActiveRecord::Migration[6.1]
  def change
    create_table :questions do |t|
      t.string :name, null: false, index: { unique: true }
      t.integer :order, null: false
      t.timestamps
    end
  end
end
