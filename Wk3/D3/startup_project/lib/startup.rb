require "employee"

class Startup
    attr_reader :name, :funding, :salaries, :employees
  def initialize(name, funding, salaries)
    @name = name
    @funding = funding
    @salaries = {}
        salaries.each do |title, salary|
            @salaries[title] = salary
        end 
    @employees = []
  end

  def valid_title?(title)
    @salaries.has_key?(title)
  end

  def >(other_start_up)
    self.funding > other_start_up.funding
  end

  def hire(name, title)
    if @salaries.has_key?(title)
        @employees << Employee.new(name, title)
    else
        raise "Error, not found!"
    end
  end

  def size
    @employees.length
  end

  def pay_employee(employee)
    payable = @salaries[employee.title]

    if @funding >= payable 
        employee.pay(payable)
        @funding -= payable
    else
        raise "not enough funding"
    end
  end

  def payday
    @employees.each do |emp|
        self.pay_employee(emp)
    end
  end

  def average_salary
    sum = 0

    @employees.each do |emp|
        sum += @salaries[emp.title]
    end

    sum / (@employees.length.to_f)
   end

   def close 
    @employees = []
    @funding = 0
   end 

   def acquire(startup)
    @funding += startup.funding 

    startup.salaries.each do |title, amt|
        if !@salaries.has_key?(title)
            @salaries[title] = amt
        end
    end

    @employees += startup.employees 

    startup.close()
   end

    
end
