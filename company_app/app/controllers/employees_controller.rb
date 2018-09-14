class EmployeesController < ApplicationController
  before_action :set_employee, only: [:destroy]

  def create
    @company = Company.find(params[:company_id])
    @employee = Employee.new(employee_params)
    @employee.company = @company
    @employee.area = Area.find(params[:employee][:area_id])
    @employee.save
    redirect_to company_path(@company)
  end

  def destroy
    if @employee.destroy
      redirect_to company_path(@employee.company), notice: 'Employee was successfully destroyed.'
    else
      redirect_to company_path(@employee.company), notice: 'Sorry try again later.'
    end
  end

  private
  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :email)
  end
end
