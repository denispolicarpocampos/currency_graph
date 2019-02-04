require 'rails_helper'

describe CurrenciesController, type: :controller do 

  it 'should display the eur charts' do
    should_display_charts('eur')
  end

  it 'should display the usd charts' do
    should_display_charts('usd')
  end

  it 'should display the aud charts' do
    should_display_charts('aud')
  end

  private

    def should_display_charts(currency)
      get :show, params: { id: currency }
      expect(response.status).to eq(200)
      expect(response).to render_template(:show)
      expect(response).to be_success
    end

end