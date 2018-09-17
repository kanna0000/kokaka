class Balance < ApplicationRecord
  def calculate_balance amount
    self.balance = -amount
  end

  def update_balance_when_primary amount
    self.balance -= amount.to_i
  end

  def update_balance_when_sub amount
    # 足してから負にする
    self.balance = -(self.balance - amount.to_i)
  end
end
