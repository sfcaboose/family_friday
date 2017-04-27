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

  test "When 5 or less employees, should only have 1 group" do
    assert Employee.count == 3
    assert Employee.group.count == 1

    employee_4 = Employee.create(name: 'Employee 4')
    assert employee_4.valid?

    assert Employee.count == 4
    assert Employee.group.count == 1


    employee_5 = Employee.create(name: 'Employee 5')
    assert employee_5.valid?

    assert Employee.count == 5
    assert Employee.group.count == 1
  end

  test "When 6 or more employees, should have more than 1 group" do
    employee_4 = Employee.create(name: 'Employee 4')
    employee_5 = Employee.create(name: 'Employee 5')
    employee_6 = Employee.create(name: 'Employee 6')
    assert employee_4.valid?
    assert employee_5.valid?
    assert employee_6.valid?

    assert Employee.count == 6
    assert Employee.group.count > 1
  end

  test "If employee is inactive, he should not be grouped" do
    employee_4 = Employee.create(name: 'Employee 4', active: false)
    assert employee_4.valid?

    Employee.group.each do |group|
      assert_not group.include?('Employee 4')
    end
  end
end
