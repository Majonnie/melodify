class InstrumentsController < ApplicationController
  def index
    @instruments = Instrument.all
  end

  def list
    #pass asc/desc as parameter
    instruments = Instrument.order("#{params[:column]} #{params[:direction]}")
    render(partial: 'table', locals: { instruments: instruments })
  end

  def show
  end

  def new
  end

  def edit
  end
end
