class EtiquettesController < ApplicationController
  def new
    @etiquette = Etiquette.new
  end

  def index
    @etiquettes = Etiquette.all
    @samples = Sample.all
    respond_to do |format|
      format.html
      format.pdf do
        render pdf: "etiquette",
               # orientation: 'Landscape',
               template: "etiquettes/index.pdf.erb",
               locals: { :etiquettes => @etiquettes }
      end
    end
  end

  def create
    @sample = Sample.find(params[:sample_id])
    @etiquette = Etiquette.new
    @etiquette.sample = @sample
    # @etiquette.sample.coffee_lot.provenance = @sample.coffee_lot.provenance
    @etiquette.save
    redirect_to etiquettes_path
  end

  private

  def etiquette_params
    params.require(:sample).permit(:sample)
  end
end
