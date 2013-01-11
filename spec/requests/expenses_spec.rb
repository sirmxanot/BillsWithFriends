require 'spec_helper'

describe "Expenses" do
  before (:each) do
    @user = FactoryGirl.create(:user)
  end

  def login_user
    #user = FactoryGirl.create(:user)
    visit login_path
    fill_in "user[email]", :with => @user.email
    fill_in "user[password]", :with => @user.password
    click_button "Sign In"
  end

  def create_expense
    #debts = Array.new(rand(1..4)) {rand(1..24999)}
    @expense = FactoryGirl.build(:expense, user_id: @user.id)
    visit new_expense_path
    fill_in "expense[expense_name]", :with => @expense.expense_name
    fill_in "expense[total_amount]", :with => @expense.total_amount
    select @expense.date_incurred.year.to_s, 
      :from => 'expense[date_incurred(1i)]'
    select Date::MONTHNAMES[@expense.date_incurred.month],
      :from => 'expense[date_incurred(2i)]'
    select @expense.date_incurred.day.to_s, 
      :from => 'expense[date_incurred(3i)]'
    @expense.you_owe_mes.each do |you_owe_me|
      fill_in "expense[memo]", :with => you_owe_me
      select you_owe_me[:debtor_id], 
        :from => 'expense[you_owe_mes_attributes[0][debtor_id]]'
      select you_owe_me[:amount], 
        :from => 'expense[you_owe_mes_attributes[0][amount]]'
    end
    #save_and_open_page
  end

  describe "Expenses/index" do
    it "should have the content 'Listing Expenses'" do
      login_user
      visit expenses_path
      page.should have_content("Listing Expenses")
    end

    it "should list an expense" do
      login_user
      create_expense
      page.should have_content("Record an Expense")
    end
  end
end