class Invoices::PurchasesController < ApplicationController

  respond_to :html, :json
  
  def index
    @purchases = Purchase.all
    respond_with(@purchases)
  end

  def show
    respond_with(@purchase)
  end

  def new
    @invoice = Invoice.find(params[:invoice_id])
    @purchase = Purchase.new
    respond_with(@invoice, @purchase)
  end

  def edit
  end

  def create
    @invoice = Invoice.find(params[:invoice_id])
    @purchase = Purchase.new(purchase_params)
    @purchase.invoice = @invoice
    @purchase.save
    respond_with(@invoice, @purchase, :location => invoice_path(@invoice))
    
#    respond_to do |format|
#      if @purchase.save
#        format.html {redirect_to @invoice, notice: 'Purchase was successfully created.'}
#        format.json {render action: 'show', status: :created, location: @invoice}
#      else
#        format.html {render action: 'new'}
#        format.json {render json: @invoice.errors, status: :unprocessable_entity}
#      end
#    end
  end

  def update
    @purchase.update(purchase_params)
    respond_with(@purchase)
  end

  def destroy
    @purchase.destroy
    respond_with(@purchase)
  end

  private
    def set_purchase
      @purchase = Purchase.find(params[:id])
    end

    def purchase_params
      params.require(:purchase).permit(:product_id, :quantity, :invoice_id)
    end
end
