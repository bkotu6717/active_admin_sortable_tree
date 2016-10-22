class CreatePincodesCities < ActiveRecord::Migration
  def change
    create_table :pincodes_cities do |t|
      t.string :pincode
      t.string :city

      t.timestamps null: false
    end
  end
end
