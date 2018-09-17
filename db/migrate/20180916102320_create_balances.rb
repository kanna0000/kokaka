class CreateBalances < ActiveRecord::Migration[5.2]
  def change
    create_table :balances do |t|
      t.string :primary_user
      t.string :sub_user
      t.integer :balance
      t.boolean :is_positive

      t.timestamps
    end
  end
end
