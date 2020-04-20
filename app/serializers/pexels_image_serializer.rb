class PexelsImageSerializer
  include FastJsonapi::ObjectSerializer
  attributes  :id,
              :image_url
end
