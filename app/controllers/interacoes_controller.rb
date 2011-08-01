class InteracoesController < ApplicationController
  # GET /interacoes
  # GET /interacoes.xml
  def index
    @interacoes = Interacao.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @interacoes }
    end
  end

  # GET /interacoes/1
  # GET /interacoes/1.xml
  def show
    @interacao = Interacao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @interacao }
    end
  end

  # GET /interacoes/new
  # GET /interacoes/new.xml
  def new
    @interacao = Interacao.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @interacao }
    end
  end

  # GET /interacoes/1/edit
  def edit
    @interacao = Interacao.find(params[:id])
  end

  # POST /interacoes
  # POST /interacoes.xml
  def create
    @interacao = Interacao.new(params[:interacao])

    respond_to do |format|
      if @interacao.save
        format.html { redirect_to(@interacao, :notice => 'Interacao was successfully created.') }
        format.xml  { render :xml => @interacao, :status => :created, :location => @interacao }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @interacao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /interacoes/1
  # PUT /interacoes/1.xml
  def update
    @interacao = Interacao.find(params[:id])

    respond_to do |format|
      if @interacao.update_attributes(params[:interacao])
        format.html { redirect_to(@interacao, :notice => 'Interacao was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @interacao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /interacoes/1
  # DELETE /interacoes/1.xml
  def destroy
    @interacao = Interacao.find(params[:id])
    @interacao.destroy

    respond_to do |format|
      format.html { redirect_to(interacoes_url) }
      format.xml  { head :ok }
    end
  end
end
