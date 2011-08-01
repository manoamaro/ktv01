class ProgramacoesController < ApplicationController
  # GET /programacoes
  # GET /programacoes.xml
  def index
    @programacoes = Programacao.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @programacoes }
    end
  end

  # GET /programacoes/1
  # GET /programacoes/1.xml
  def show
    @programacao = Programacao.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @programacao }
    end
  end

  # GET /programacoes/new
  # GET /programacoes/new.xml
  def new
    @programacao = Programacao.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @programacao }
    end
  end

  # GET /programacoes/1/edit
  def edit
    @programacao = Programacao.find(params[:id])
  end

  # POST /programacoes
  # POST /programacoes.xml
  def create
    @programacao = Programacao.new(params[:programacao])

    respond_to do |format|
      if @programacao.save
        format.html { redirect_to(@programacao, :notice => 'Programacao was successfully created.') }
        format.xml  { render :xml => @programacao, :status => :created, :location => @programacao }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @programacao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /programacoes/1
  # PUT /programacoes/1.xml
  def update
    @programacao = Programacao.find(params[:id])

    respond_to do |format|
      if @programacao.update_attributes(params[:programacao])
        format.html { redirect_to(@programacao, :notice => 'Programacao was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @programacao.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /programacoes/1
  # DELETE /programacoes/1.xml
  def destroy
    @programacao = Programacao.find(params[:id])
    @programacao.destroy

    respond_to do |format|
      format.html { redirect_to(programacoes_url) }
      format.xml  { head :ok }
    end
  end
end
