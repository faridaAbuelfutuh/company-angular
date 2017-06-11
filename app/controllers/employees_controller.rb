class EmployeesController < ApplicationController
  before_action :set_employee, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  # GET /employees
  # GET /employees.json
  def index
    @employees = Employee.all
  end

  # GET /employees/1
  # GET /employees/1.json
  def show
  end

  # GET /employees/new
  def new
    @employee = Employee.new
  end
  
  def list
     @employee = Employee.find_by_id(params[:id])
     @company=@employee.companies
     render json: @company
  end

  def assign
     @employee=Employee.find_by_id(params[:id]) if (Employee.find_by_id(params[:id]))!=nil
     @employee.companies << Company.find_by_name(params[:company_ids]) if (Company.find_by_name(params[:company_ids]))!=nil
     @employee.companies.create(name: params[:company_ids])if (Company.find_by_name(params[:company_ids]))==nil

     render json: "done"
      
  end


  # GET /employees/1/edit
  def edit
  end

  # POST /employees
  # POST /employees.json
  def create
    @employee = Employee.new(employee_params)

    respond_to do |format|
      if @employee.save
        format.html { redirect_to @employee, notice: 'Employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /employees/1
  # PATCH/PUT /employees/1.json
  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to @employee, notice: 'Employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employees/1
  # DELETE /employees/1.json
  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to employees_url, notice: 'Employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employee
      @employee = Employee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employee_params
      params.permit(:name)
    end
end
