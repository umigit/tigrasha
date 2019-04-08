json.array!(@sightings) do |sighting|
  json.id sighting.id
  json.image_url url_for(sighting.image)
end
