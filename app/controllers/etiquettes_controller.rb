class EtiquettesController < ApplicationController
  def new
    @etiquette = Etiquette.new
  end

  def index
    @etiquettes = Etiquette.all
    @samples = Sample.all
  end

  def create
    @sample = Sample.find(params[:id])
    @etiquette = Etiquette.new(@sample)
    @etiquette.sample.coffee_lot.provenance = @sample.coffee_lot.provenance
    @etiquette.save
    redirect_to etiquette_path
  end

  # def show_etiquette
  #   @etiquette = Etiquette.find(params[:id])
#   # end
end
