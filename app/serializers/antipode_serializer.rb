# frozen_string_literal: true

class AntipodeSerializer
  include FastJsonapi::ObjectSerializer
  attr_accessor   :location_name,
                  :forecast,
                  :search_location,
                  :id

  attributes :location_name, :forecast, :search_location
end
