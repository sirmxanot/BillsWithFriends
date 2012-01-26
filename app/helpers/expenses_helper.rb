module ExpensesHelper
def setup_expense(expense)
    expense.you_owe_me ||= You_owe_me.new
    expense
  end

end
