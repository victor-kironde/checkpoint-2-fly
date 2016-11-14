module FlightsHelper
  include Messages
  def check_search(origin, destination, date)
    errors = []
    errors << invalid_route if origin == destination
    check_date(date, errors)
    errors
  end

  private

  def check_date(date, errors)
    date = Time.parse(date)
    if date < Time.now
      errors << invalid_date_early
    end
  rescue ArgumentError
    errors << invalid_date_format
  end
end
