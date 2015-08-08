# == Schema Information
#
# Table name: tickets
#
#  id         :integer          not null, primary key
#  name       :string
#  email      :string
#  ticket_no  :integer
#  waiting    :boolean          default(TRUE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Ticket < ActiveRecord::Base
  scope :waiting, -> {where(waiting: true)}

  validates :name, presence: true
  validates :email, presence: true, format: {with: /\A[a-zA-Z][\w\.\+-]*[a-zA-Z0-9]@[a-zA-Z0-9][\w\.-]*[a-zA-Z0-9]\.[a-zA-Z][a-zA-Z\.]*[a-zA-Z]\z/}

  before_create :set_token_time

  def activate!
    CurrentTicket.fetch.set_ticket(self)
  end

  private
    def set_token_time
      self.ticket_no = Ticket.count + 1
    end
end
