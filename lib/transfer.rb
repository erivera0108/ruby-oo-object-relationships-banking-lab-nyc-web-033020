require 'pry'
class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status, :bankaccount
  def initialize(sender, receiver, amount)
    @amount = amount
    @sender = sender
    @receiver = receiver
    @status = "pending"
  end

  def valid?
    # binding.pry
    self.sender.valid? && self.receiver.valid?
  end

  def execute_transaction
    #to be able to check if the sender is valid
    #push/shovel amount from sender to receiver hash
    #condition that it could only happen once
    if self.sender.valid? && self.sender[:balance] > 0
      self.receiver[:balance] += self.amount
    else
      false
    end
  end
end
