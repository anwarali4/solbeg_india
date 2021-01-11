class CreateAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :addresses do |t|
      t.string :line_1,    null: false, default: ""
      t.string :Street,    null: false, default: ""
      t.string :Landmark,  null: false, default: ""
      t.string :City,      null: false, default: ""
      t.string :State,     null: false, default: ""
      t.string :pin_code,  null: false, default: ""
      t.timestamps
    end
  end
end
