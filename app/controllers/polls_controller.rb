class PollsController < ApplicationController
    def index
        @poll = Poll.where(finished_at: nil).last
        @poll_options = @poll.poll_options
    end

    def create
        @poll = Poll.last
        @poll_option = @poll.poll_options.find params[:poll_option_id]
        @poll_option.increment! :votes
    
        respond_to do |format|
          format.turbo_stream { render :poll }
        end
    end
end
