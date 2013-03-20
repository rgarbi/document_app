require 'spec_helper'

describe "documents/index" do
  before(:each) do
    assign(:documents, [
      stub_model(Document,
        :creator => "Creator",
        :name => "Name",
        :num_pages => 1
      ),
      stub_model(Document,
        :creator => "Creator",
        :name => "Name",
        :num_pages => 1
      )
    ])
  end

  it "renders a list of documents" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Creator".to_s, :count => 2
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
