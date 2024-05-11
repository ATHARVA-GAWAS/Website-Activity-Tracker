class ActivityController < ApplicationController
    def track
      # Assuming the request contains parameters specifying the activity details
      activity_type = params[:activity_type]
      user_id = params[:user_id]
      timestamp = Time.now
  
      # Create a new activity record in the database
      activity = Activity.new(activity_type: activity_type, user_id: user_id, timestamp: timestamp)
  
      if activity.save
        render json: { message: 'Activity tracked successfully' }, status: :created
      else
        render json: { error: 'Failed to track activity' }, status: :unprocessable_entity
      end
    end
  end
  