class Api::V1::Antipode::AntipodeController < ApplicationController
  def new
    new_antipode = AntipodeFacade.new(params[:location])
  end
end
