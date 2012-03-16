require 'spec_helper'

describe "Expenses" do
  
  describe "Expenses/index" do
   	let(:user) {Factory(:user)}

    it "should have the content 'Listing expenses'" do
    	user = Factory(:user)
    	visit login_path
  	end
  end
end
