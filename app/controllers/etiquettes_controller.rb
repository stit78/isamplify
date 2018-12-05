class EtiquettesController < ApplicationController
  def new
    @etiquette = Etiquette.new
  end

  def index
    @etiquettes = Etiquette.all
  end
end
