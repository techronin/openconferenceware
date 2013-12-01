require 'spec_helper'

describe "session_types/edit.html.erb" do
  include SessionTypesHelper
  
  before(:each) do
    @event = stub_current_event!
    @session_type = stub_model(SessionType,
      event: @event
    )
    assign(:session_type, @session_type)
  end

  it "should render edit form" do
    render
    
    rendered.should have_selector("form[action='#{session_type_path(@session_type)}'][method='post']") do |node|
      node.should have_selector("input#session_type_title[name='session_type[title]']")
      node.should have_selector("textarea#session_type_description[name='session_type[description]']")
      node.should have_selector("input#session_type_duration[name='session_type[duration]']")
    end
  end
end


