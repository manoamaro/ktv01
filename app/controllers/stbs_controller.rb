class StbsController < ApplicationController
  # GET /stbs
  # GET /stbs.xml
  def index
    @stbs = Stb.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @stbs }
    end
  end

  # GET /stbs/1
  # GET /stbs/1.xml
  def show
    @stb = Stb.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @stb }
    end
  end

  # GET /stbs/new
  # GET /stbs/new.xml
  def new
    @stb = Stb.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @stb }
    end
  end

  # GET /stbs/1/edit
  def edit
    @stb = Stb.find(params[:id])
  end

  # POST /stbs
  # POST /stbs.xml
  def create
    @stb = Stb.new(params[:stb])

    respond_to do |format|
      if @stb.save
        format.html { redirect_to(@stb, :notice => 'Stb was successfully created.') }
        format.xml  { render :xml => @stb, :status => :created, :location => @stb }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @stb.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /stbs/1
  # PUT /stbs/1.xml
  def update
    @stb = Stb.find(params[:id])

    respond_to do |format|
      if @stb.update_attributes(params[:stb])
        format.html { redirect_to(@stb, :notice => 'Stb was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @stb.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /stbs/1
  # DELETE /stbs/1.xml
  def destroy
    @stb = Stb.find(params[:id])
    @stb.destroy

    respond_to do |format|
      format.html { redirect_to(stbs_url) }
      format.xml  { head :ok }
    end
  end
end
