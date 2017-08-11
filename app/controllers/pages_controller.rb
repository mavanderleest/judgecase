class PagesController < ApplicationController
  def home
    @message = Message.new
  end

  def businesses
    @businesses = Business.all
  end
end
