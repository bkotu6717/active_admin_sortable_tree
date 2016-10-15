class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :title
      t.text :body
      t.integer :position

      t.timestamps null: false
    end
  end
end
