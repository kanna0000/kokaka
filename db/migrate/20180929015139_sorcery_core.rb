  class SorceryCore < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.remove :encrypted_password
      t.remove :reset_password_token
      t.remove :reset_password_sent_at
      t.remove :remember_created_at
      t.string :crypted_password
      t.string :salt

      t.timestamps
    end
  end
end
