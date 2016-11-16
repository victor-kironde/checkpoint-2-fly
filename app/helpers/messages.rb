module Messages
  def sign_up_welcome(user)
    "Welcome #{user.full_name}"
  end

  def log_in_success(user)
    "Welcome back, #{user.full_name}"
  end

  def log_in_error
    "Incorrect email or password."
  end

  def log_out_success
    "You have successfully Logged out"
  end

  def invalid_route
    "Origin and Destination airport cannot be the same."
  end

  def invalid_date_early
    "Date cannot be same as or earlier than current date."
  end

  def invalid_date_format
    "Invalid date entered."
  end

  def no_flight_selected
    "No flight was selected."
  end

  def booking_saved
    "Your booking was successfully created."
  end

  def booking_updated
    "Your booking was successfully updated."
  end

  def booking_deleted
    "Your booking was successfully deleted!"
  end

  def booking_found
    "Booking found."
  end

  def booking_not_found
    "Booking does not exist."
  end
end
