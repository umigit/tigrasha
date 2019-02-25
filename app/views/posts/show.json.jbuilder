json.array!(@sightings) do |sighting|
  json.image_url url_for(sighting.image)
  json.id sighting.id
end
