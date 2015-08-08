class HomeController < ApplicationController
  def welcome
    if Ticket.waiting.any?
      @waiting_count = Ticket.waiting.count
      @current_ticket = Ticket.waiting.first
      @new_ticket = Ticket.new
      @new_ticket.ticket_no = Ticket.count + 1
      @seconds_left = 56
    else
      @seconds_left = 0
    end
  
  end

  
end
