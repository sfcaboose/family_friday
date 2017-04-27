class Employee < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { case_sensitive: false }
  scope :active, -> { where(active: true) }

  ##
  # Returns a randomized array of arrays, each array containing 3-5 employees' names

  def self.group
    groups = {}
    all_locations = Employee.pluck(:location).uniq

    all_locations.each do |location|
      employees = Employee.where(location: location, active: true).pluck(:name)
      location_groups = employees.shuffle.in_groups_of(3, false)

      if location_groups.count > 1 && location_groups.last.count < 3
        location_groups[0] += location_groups.last
        location_groups.delete_at(-1)
      end

      groups[location] = location_groups
    end

    return groups
  end
end
