class Loan < ActiveRecord::Base
  belongs_to :lender
  belongs_to :borrower

  validates :amount, presence: { message: "Amount field must be filled out"}, numericality: {greater_than: 0, message: "Loan amount must be greater than $0"}
end
