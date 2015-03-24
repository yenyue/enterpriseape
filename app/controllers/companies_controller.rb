class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  respond_to :html

  def index
#   @companies = Company.all
#    respond_with(@companies)
    @search = CompanySearch.new(params[:search])
    @companies = @search.scope
    @@report = @search
      
    respond_to do |format|
      format.html
#      format.csv { render text: @companies.to_csv }
      format.csv { send_data @companies.to_csv }
    end
   end

  def show
    respond_with(@company)
  end

  def new
    @company = Company.new
    respond_with(@company)
  end

  def edit
  end

  def create
    @company = Company.new(company_params)
    @company.save
    respond_with(@company)
  end

  def update
    @company.update(company_params)
    respond_with(@company)
  end

  def destroy
    @company.destroy
    respond_with(@company)
  end
  
  def import
    Company.import(params[:file])
    redirect_to companies_path, notice: "Companies Added Successfully"
  end
  
  def search
#    @reportsearch = CompanySearch.new(params[:search])
#    @companies = @reportsearch.scope

    @companies = Company.where('status like ? AND  terms = ?', @@report.status, @@report.terms)

    respond_to do |format|
      format.html
#      format.csv { render text: @companies.to_csv }
      format.csv { send_data @companies.to_csv }
    end
  end
    

  private
    def set_company
      @company = Company.find(params[:id])
    end

    def company_params
      params.require(:company).permit(:name, :manager, :status, :terms)
    end
end
