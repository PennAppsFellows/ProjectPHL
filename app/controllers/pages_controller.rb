class PagesController < ApplicationController
  def home
    if !user_signed_in?
      render :layout => false
    end
  end
end
