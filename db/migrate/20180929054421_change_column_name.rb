class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    change_table :users do |t|
      t.rename :crypted_password, :password_digest
      t.remove :salt
    end
  end
end
