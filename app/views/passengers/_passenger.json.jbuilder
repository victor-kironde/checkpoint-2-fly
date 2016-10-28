json.extract! passenger, :id, :first_name, :last_name, :email, :passport_number, :created_at, :updated_at
json.url passenger_url(passenger, format: :json)