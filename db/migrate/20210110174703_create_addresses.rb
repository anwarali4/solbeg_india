class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :line_1,    null: false, default: ""
      t.string :street,    default: ""
      t.string :landmark,  default: ""
      t.string :city,      default: ""
      t.string :state,     null: false, default: ""
      t.string :pin_code,  null: false, default: ""
      t.timestamps
    end
  end
end
