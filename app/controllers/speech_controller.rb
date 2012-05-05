class SpeechController < ApplicationController
  def index
    @talk = Talk.new
  end

  def create 
    @talk = Talk.new(params[:talk])
    if @talk.save!
      redirect_to :action => 'index'
    end
  end

  def result
    @talk = Talk.find(:last)
  end
end
