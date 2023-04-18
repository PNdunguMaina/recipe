require 'rails_helper'

RSpec.describe 'recips/edit', type: :view do
  let(:recip) do
    Recip.create!
  end

  before(:each) do
    assign(:recip, recip)
  end

  it 'renders the edit recip form' do
    render

    assert_select 'form[action=?][method=?]', recip_path(recip), 'post' do
    end
  end
end
