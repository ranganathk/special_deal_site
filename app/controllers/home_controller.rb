class HomeController < ApplicationController
  def welcome
    if Ticket.any?
      token_time = Ticket.first.created_at + Ticket.count.minutes
      @seconds_left = (token_time - Time.now).to_i
    else
      @seconds_left = 0
    end
    @ticket_no = Ticket.count + 1
    @ticket = Ticket.new
  end

  
end
