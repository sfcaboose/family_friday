class Employee < ActiveRecord::Base
  validates :name, presence: true, uniqueness: { case_sensitive: false }

  ##
  # Returns a randomized array of arrays, each array containing 3-5 employees' names

  def self.group
    # Get the names of all employees, shuffle them, and split them into groups of 3
    groups = Employee.all.map(&:name).shuffle.in_groups_of(3, false)

    # If the last group has less than 3 people, add them to the first group
    if groups.count > 1 && groups.last.count < 3
      groups[0] += groups.last
      groups.delete_at(-1)
    end

    return groups
  end
end
