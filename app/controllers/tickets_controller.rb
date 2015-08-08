class TicketsController < ApplicationController
  def create 
    @ticket = Ticket.new(ticket_params)
    if @ticket.save
      redirect_to ticket_path(@ticket)
    else
      redirect_to root_path, alert: "Please enter your name and email"
    end
  end

  def show
    @ticket = Ticket.find(params[:id])
  end

  private 

    def ticket_params
      params.require(:ticket).permit(:name, :email)
    end
end
