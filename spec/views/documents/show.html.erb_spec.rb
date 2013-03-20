require 'spec_helper'

describe "documents/show" do
  before(:each) do
    @document = assign(:document, stub_model(Document,
      :creator => "Creator",
      :name => "Name",
      :num_pages => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Creator/)
    rendered.should match(/Name/)
    rendered.should match(/1/)
  end
end
