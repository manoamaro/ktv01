class ClassificacoesController < ApplicationController
  # GET /classificacoes
  # GET /classificacoes.xml
  def index
    @classificacoes = Classificacao.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @classificacoes }
    end
  end

  # GET /classificacoes/1
  # GET /classificacoes/1.xml
  def show
    @classificacao = Classificacao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @classificacao }
    end
  end

  # GET /classificacoes/new
  # GET /classificacoes/new.xml
  def new
    @classificacao = Classificacao.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @classificacao }
    end
  end

  # GET /classificacoes/1/edit
  def edit
    @classificacao = Classificacao.find(params[:id])
  end

  # POST /classificacoes
  # POST /classificacoes.xml
  def create
    @classificacao = Classificacao.new(params[:classificacao])

    respond_to do |format|
      if @classificacao.save
        format.html { redirect_to(@classificacao, :notice => 'Classificacao was successfully created.') }
        format.xml  { render :xml => @classificacao, :status => :created, :location => @classificacao }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @classificacao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /classificacoes/1
  # PUT /classificacoes/1.xml
  def update
    @classificacao = Classificacao.find(params[:id])

    respond_to do |format|
      if @classificacao.update_attributes(params[:classificacao])
        format.html { redirect_to(@classificacao, :notice => 'Classificacao was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @classificacao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /classificacoes/1
  # DELETE /classificacoes/1.xml
  def destroy
    @classificacao = Classificacao.find(params[:id])
    @classificacao.destroy

    respond_to do |format|
      format.html { redirect_to(classificacoes_url) }
      format.xml  { head :ok }
    end
  end
end
