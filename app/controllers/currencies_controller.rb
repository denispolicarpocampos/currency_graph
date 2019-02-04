class CurrenciesController < ApplicationController
  def show
    currency_kind = params[:id] ? params[:id].downcase : ''
    @currencies = CurrencyRangeService.call(currency_kind, params[:range].to_i)

    respond_to do |format|
      format.html
      format.js 
    end
  end
end