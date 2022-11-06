class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|

      t.timestamps
      
   
      t.integer :customer_id
      t.string :name
      t.string :postal_code
      t.string :address
  
      
    end
  end
end
