json.array!(@bookings) do |booking|
  json.extract! booking, :id, :status, :date_in, :date_out, :hotel_id
  json.url booking_url(booking, format: :json)
end
