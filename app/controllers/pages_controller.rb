class PagesController < ApplicationController
  def home
  end

  def businesses
    @partners = Partner.all
  end
end
