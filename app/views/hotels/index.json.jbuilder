json.array!(@hotels) do |hotel|
  json.extract! hotel, :id, :name, :email, :phone, :about, :stars, :address, :photo_url
  json.url hotel_url(hotel, format: :json)
end
