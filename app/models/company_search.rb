class CompanySearch
  attr_reader :status, :terms
  
  def initialize(params)
    params ||= {}
    @status = params[:status]
    @terms = params[:terms]
  end
  
  def scope
    if @status == "" and @terms == ""
      Company.all
    elsif @status == "" and @terms != ""
      Company.where('terms = ?', @terms)
    elsif @status != "" and @terms == ""
      Company.where('status like ?', @status)
    else
      Company.where('status like ? AND  terms = ?', @status, @terms)
    end
  end
  
  private
  

end