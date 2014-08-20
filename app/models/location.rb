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

    def date_information(redemptions)
      grouped_dates = []
      redemptions.group("date_trunc('day', redemptions.created_at)").count(:id).each do |k, v|
        grouped_dates.push({date: k.strftime('%m-%e-%Y'), val: v})
      end
      grouped_dates.sort_by do |d|
        d[:date]
      end
    end
  end
end
