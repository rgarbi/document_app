require 'spec_helper'

describe "documents/edit" do
  before(:each) do
    @document = assign(:document, stub_model(Document,
      :creator => "MyString",
      :name => "MyString",
      :num_pages => 1
    ))
  end

  it "renders the edit document form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => documents_path(@document), :method => "post" do
      assert_select "input#document_creator", :name => "document[creator]"
      assert_select "input#document_name", :name => "document[name]"
      assert_select "input#document_num_pages", :name => "document[num_pages]"
    end
  end
end
