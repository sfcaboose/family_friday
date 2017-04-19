require 'test_helper'

class EmployeeTest < ActiveSupport::TestCase

  test "Adding employee should succeed" do
    employee = Employee.create(name: 'Sidney')
    assert employee.valid?
  end

  test "Should not be able to add employee with blank name" do
    employee = Employee.create(name: '')
    assert_not employee.valid?
  end

  test "Should not be able to add employees with the same name" do
    employee_1 = Employee.create(name: 'Sidney')
    assert employee_1.valid?
    employee_2 = Employee.create(name: 'Sidney')
    assert_not employee_2.valid?
  end

end
