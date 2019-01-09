require 'rails_helper'

class FavoriteDataHelper
  attr_reader :user
  def initialize(user)
    binding.pry
    @user = user
    new = WeatherDataHelper()
  end

  def user_favorites
    @user.favorites
  end

  def current_weather


  end

  def location
    
  end

end
