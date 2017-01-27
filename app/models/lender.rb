class Lender < ActiveRecord::Base
  has_secure_password
  has_many :loans
  has_many :borrowers, :through => :loans

  validates :f_name, presence: { message: "First name must be entered"}
  validates :l_name, presence: { message: "Last name must be entered"}
  validates :balance, presence: { message: "Money field must be filled out"}
  validates :email, presence: { message: "Email must be entered"}
  validates :password, presence: { message: "Password must be entered and must be at least 6 characters"}, length: {minimum: 6}, :on => :create
  validates :password_confirmation, presence: { message: "Passwords must match"}, :on => :create

  def withdraw(lent_amouunt)
      new_balance = self.balance - lent_amouunt.to_i
      puts "NEW BALANCE AMOUNT: #{new_balance}"
      self.update(balance:new_balance)
  end
end
