class CreateCacheBustings < ActiveRecord::Migration
  def change
    create_table :cache_bustings do |t|
      t.string :url
      t.string :done_by

      t.timestamps null: false
    end
  end
end
