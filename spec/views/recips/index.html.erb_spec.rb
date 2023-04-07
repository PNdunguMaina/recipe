require 'rails_helper'

RSpec.describe "recips/index", type: :view do
  before(:each) do
    assign(:recips, [
      Recip.create!(),
      Recip.create!()
    ])
  end

  it "renders a list of recips" do
    render
    cell_selector = Rails::VERSION::STRING >= '7' ? 'div>p' : 'tr>td'
  end
end
