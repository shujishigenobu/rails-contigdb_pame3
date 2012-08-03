class BlastResultsController < ApplicationController
  def plain
  	model = Object.const_get(params[:model])
  	@blast_result = model.find(params[:rid]).record
  end
end
