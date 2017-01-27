class Borrower < ActiveRecord::Base
    has_secure_password
    has_many :loans
    has_many :lenders, :through => :loans

    validates :f_name, presence: { message: "First name must be entered"}
    validates :l_name, presence: { message: "Last name must be entered"}
    validates :cause, presence: { message: "Need Money For field must be filled out"}
    validates :description, presence: { message: "Description field must be filled out"}
    validates :email, presence: { message: "Email must be entered"}
    validates :password, presence: { message: "Password must be entered and must be at least 6 characters"}, length: {minimum: 6}, :on => :create
    validates :password_confirmation, presence: { message: "Passwords must match"}, :on => :create

    def amount_raised
        total = 0
        self.loans.each do |loan|
            total+=loan.amount
        end
        return total
    end
end
