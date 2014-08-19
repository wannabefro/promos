require 'geokit'

module Locationable
  extend ActiveSupport::Concern

  included do
    serialize :location
    after_create :get_location
  end

  def get_location
    self.location = Geokit::Geocoders::MultiGeocoder.geocode(ip_address)
    self.save!
  end

end
