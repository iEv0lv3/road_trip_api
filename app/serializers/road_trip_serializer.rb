class RoadTripSerializer
  include FastJsonapi::ObjectSerializer
  attributes  :id,
              :origin,
              :destination,
              :forecast
end
