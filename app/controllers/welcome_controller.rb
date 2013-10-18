class WelcomeController < ApplicationController
  before_filter :check_for_login
  skip_before_filter :validated_user

  def index
    @buzz = Item.where(:permission => "public").limit(50).map{|bz|[rand,bz]}.sort
  end
 
 private
 
 def check_for_login
  redirect_to buzz_index_path if user_signed_in?
 end

end
