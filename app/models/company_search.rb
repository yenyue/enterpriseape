class CompanySearch
  attr_reader :status, :terms
  
  def initialize(params)
    params ||= {}
    @status = params[:status]
    @terms = params[:terms]
  end
  
  def scope
    Company.where('status = ? AND  terms = ?', @status, @terms)
  end
  
  private
  

end