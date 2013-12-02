class SellersController < ApplicationController
  # GET /sellers
  # GET /sellers.json
  def index
    @sellers = Seller.search(params[:search])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @sellers }
    end
  end

  # GET /sellers/1
  # GET /sellers/1.json
  def show
    @seller = Seller.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @seller }
    end
  end

  # GET /sellers/new
  # GET /sellers/new.json
  def new
    @seller = Seller.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @seller }
    end
  end

  # GET /sellers/1/edit
  def edit
    @seller = Seller.find(params[:id])
  end

  # POST /sellers
  # POST /sellers.json
  def create
    @seller = Seller.new(params[:seller])

    respond_to do |format|
      if @seller.save
        @seller.to_user.update_attributes({:password => @seller.email, :password_confirmation => @seller.email})
        format.html { redirect_to @seller, :notice => t('activerecord.successful.messages.created', :model => Seller.model_name.human) }
        format.json { render :json => @seller, :status => :created, :location => @seller }
      else
        format.html { render :action => "new" }
        format.json { render :json => @seller.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /sellers/1
  # PUT /sellers/1.json
  def update
    @seller = Seller.find(params[:id])

    respond_to do |format|
      if @seller.update_attributes(params[:seller])
        format.html { redirect_to @seller, :notice => t('activerecord.successful.messages.updated', :model => Seller.model_name.human) }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @seller.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /sellers/1
  # DELETE /sellers/1.json
  def destroy
    @seller = Seller.find(params[:id])
    @seller.destroy

    respond_to do |format|
      format.html { redirect_to sellers_url }
      format.json { head :ok }
    end
  end

  # ++++++++++++++ #
  # CUSTOM ACTIONS #
  # -------------- #

  def external_links
  end
end
