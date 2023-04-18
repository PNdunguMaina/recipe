require 'rails_helper'

RSpec.describe 'recips/new', type: :view do
  before(:each) do
    assign(:recip, Recip.new)
  end

  it 'renders new recip form' do
    render

    assert_select 'form[action=?][method=?]', recips_path, 'post' do
    end
  end
end
