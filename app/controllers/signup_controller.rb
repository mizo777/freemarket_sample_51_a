class SignupController < ApplicationController
  skip_before_action :authenticate_user! , only: [:index] 

  def step1
  end
  def step2   
  end
  def step3   
  end
  def step4   
  end
  def done   
  end
end
