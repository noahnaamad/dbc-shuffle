class UsersController < ApplicationController
  before_action :set_widget, only: [:show, :edit, :update, :destroy]

  # GET /widgets
  # GET /widgets.json
  def new
    @user = User.new
  end


end
