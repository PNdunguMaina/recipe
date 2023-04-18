require 'rails_helper'

RSpec.describe 'recips/show', type: :view do
  before(:each) do
    assign(:recip, Recip.create!)
  end

  it 'renders attributes in <p>' do
    render
  end
end
