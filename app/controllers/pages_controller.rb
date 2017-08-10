class PagesController < ApplicationController
  def home
  end

  def businesses
    @businesses = Business.all
  end
end
