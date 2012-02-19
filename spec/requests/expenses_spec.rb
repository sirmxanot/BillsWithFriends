require 'spec_helper'

describe "Expenses" do
  
  describe "Expenses/index" do
   	let(:user) {Factory(:user)}

    it "should have the content 'Listing expenses'" do
    	visit '/expenses'
    	page.should have_content('Listing expenses')
  	end
  end
end
