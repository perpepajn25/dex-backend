class CreateCards < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.integer :deck_id
      t.string :question
      t.string :answer

      t.timestamps
    end
  end
end
