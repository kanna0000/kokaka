class Balance < ApplicationRecord
  def calculate_balance amount
    self.balance = -amount.to_i
  end

  def update_balance_as_primary amount
    # 常に引く
    self.balance -= amount.to_i
  end

  def update_balance_as_sub amount
    # 常に足す
    self.balance += amount.to_i
  end
end
