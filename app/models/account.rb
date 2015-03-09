class Account < ActiveRecord::Base
  before_save :generate_unique_account_number
  belongs_to :user

  has_many :expenses, class_name: 'Transaction', foreign_key: "sender_id"
  has_many :incomes,  class_name: 'Transaction', foreign_key: "receiver_id"
  # has_many :topups,  class_name: 'Topup', foreign_key: "receiver_id"


  def current_user_account
    Account.find_by_user(current_user)
  end

  def transactions
    expenses + incomes #topups.amount +
  end

  def balance
    incomes.map(&:amount).sum - expenses.map(&:amount).sum  #topups.map(&:amount).sum +
  end

  def generate_unique_account_number
    generate_new = nil
    loop do
      generate_new = generate_account_number
      break unless Account.exists?(number: generate_new)
    end

    self.number = generate_new
  end

  def generate_account_number
    random_figure = rand(1000000000..9999999999)
    division = random_figure / 97
    multiplication = division * 97
    rest = random_figure - multiplication

    if rest < 10
      number = "#{random_figure}#{rest}"
    else
      number = "#{random_figure}0#{rest}"
    end
    number
  end

  def to_s
    "#{number}"
  end
end
