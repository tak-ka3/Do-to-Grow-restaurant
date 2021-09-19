class CreateTodos < ActiveRecord::Migration[6.1]
  def change
    create_table :todos do |t|
      t.string :task, null: false
      t.datetime :due, null: false
      t.integer :priority, null: false
      t.boolean :is_completed, null: false, default: false

      t.timestamps
    end
  end
end
