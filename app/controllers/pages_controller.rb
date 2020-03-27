class PagesController < ApplicationController
  def home
    if current_user && current_user.campaigns.count > 0
      redirect_to campaigns_path
    end
  end
end
