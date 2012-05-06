# -*- coding: utf-8 -*-
class SpeechController < ApplicationController
  #辞書領域
  @@forward = ['forward','全身','前進','前身']
  @@backward = ['backward','後退','交代','抗体','交替']
  @@goleft = ['go left','左旋回']
  @@goright = ['go right','右旋回']
  @@takeoff = ['take off','離陸','take']
  @@landing = ['touch down','着陸','landing']
  @@emergency_stop = ['emergency stop','緊急停止']
  @@turning_right = ['turn right','右回転']
  @@turning_left = ['turn left','左回転']
  @@goup = ['go up','上昇']
  @@godown = ['go down','下降','加工']
  @@frontcamera = ['front camera','前']
  @@bothcamera = ['both camera','両方']
  @@verticalcamera = ['vertical camera','空撮']
  @@togglecamera = ['toggle','切り替え']

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
    #以下はステータスコードの記述
    if @@forward.include?(@talk.name) 
      @talk.status = "UP"
      @talk.save!
    elsif @@backward.include?(@talk.name)
      @talk.status = "DOWN"
      @talk.save!
    elsif @@goleft.include?(@talk.name)
      @talk.status = "LEFT"
      @talk.save!
    elsif @@goright.include?(@talk.name)
      @talk.status ="RIGHT"
      @talk.save!
    elsif @@takeoff.include?(@talk.name)
      @talk.status ="SHIFT"
      @talk.save!
    elsif @@landing.include?(@talk.name)
      @talk.status = "CONTROL"
      @talk.save!
    elsif @@emergency_stop.include?(@talk.name)
      @talk.status = "s"
      @talk.save!
    elsif @@turning_right.include?(@talk.name)
      @talk.status = "r"
      @talk.save!
    elsif @@turning_left.include?(@talk.name)
      @talk.status = "l"
      @talk.save!
    elsif @@goup.include?(@talk.name)
      @talk.status = "u"
      @talk.save!
    elsif @@godown.include?(@talk.name)
      @talk.status = "d"
      @talk.save!
    elsif @@frontcamera.include?(@talk.name)
      @talk.status = "1"
      @talk.save!
    elsif @@bothcamera.include?(@talk.name)
      #ステータスコードの4も兼ねる
      @talk.status = "2"
      @talk.save!
    elsif @@verticalcamera.include?(@talk.name)
      @talk.status = "3"
      @talk.save!
    elsif @@togglecamera.include?(@talk.name)
      @talk.status = "5"
      @talk.save!
    else
      #辞書に照合データが該当しないとき
      @talk.status = "0"
      @talk.save!
   end
 end
end
