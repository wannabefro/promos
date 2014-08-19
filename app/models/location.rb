require 'active_support/inflections'
require 'action_view/helpers'

class Location
  extend ActionView::Helpers
  class << self
    def map_information(locations)
      grouped_locations = []
      locations.group_by(&:country_code).each do |k, v|
        grouped_locations.push({id: k, title: "#{pluralize(v.count, 'total download')}"})
      end
      grouped_locations
    end
  end
end
