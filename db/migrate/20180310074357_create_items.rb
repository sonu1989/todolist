class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.integer :todo_id
      t.string :title
      t.integer :state

      t.timestamps
    end
  end
end
