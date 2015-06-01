#Purpose: Allow user to clear view history by removing specified cookie

class HistoriesController < ApplicationController

  def destroy
    cookies.delete('user_ids')
    redirect_to root_url, notice: "Your history is history!"
  end

end