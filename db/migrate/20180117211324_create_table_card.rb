class CreateTableCard < ActiveRecord::Migration[5.1]
  def change
    create_table :cards do |t|
      t.references :list, foreign_key: true
      t.text :description
      t.string :name
      t.integer :position
    end
  end
end
