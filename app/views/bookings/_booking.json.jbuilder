json.extract! booking, :id, :cost, :created_at, :updated_at
json.url booking_url(booking, format: :json)
