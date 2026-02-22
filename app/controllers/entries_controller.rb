class EntriesController < ApplicationController
  def index
  end

  def show
    @entry = Entry.find(params[:id])
  end

  def new
  end

  def edit
  end
end
