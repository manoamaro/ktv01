class EmissorasController < ApplicationController
  # GET /emissoras
  # GET /emissoras.xml
  def index
    @emissoras = Emissora.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @emissoras }
    end
  end

  # GET /emissoras/1
  # GET /emissoras/1.xml
  def show
    @emissora = Emissora.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @emissora }
    end
  end

  # GET /emissoras/new
  # GET /emissoras/new.xml
  def new
    @emissora = Emissora.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @emissora }
    end
  end

  # GET /emissoras/1/edit
  def edit
    @emissora = Emissora.find(params[:id])
  end

  # POST /emissoras
  # POST /emissoras.xml
  def create
    @emissora = Emissora.new(params[:emissora])

    respond_to do |format|
      if @emissora.save
        format.html { redirect_to(@emissora, :notice => 'Emissora was successfully created.') }
        format.xml  { render :xml => @emissora, :status => :created, :location => @emissora }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @emissora.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /emissoras/1
  # PUT /emissoras/1.xml
  def update
    @emissora = Emissora.find(params[:id])

    respond_to do |format|
      if @emissora.update_attributes(params[:emissora])
        format.html { redirect_to(@emissora, :notice => 'Emissora was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @emissora.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /emissoras/1
  # DELETE /emissoras/1.xml
  def destroy
    @emissora = Emissora.find(params[:id])
    @emissora.destroy

    respond_to do |format|
      format.html { redirect_to(emissoras_url) }
      format.xml  { head :ok }
    end
  end
end
