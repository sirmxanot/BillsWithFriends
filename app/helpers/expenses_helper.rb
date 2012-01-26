module ExpensesHelper
def setup_expense(expense)
    expense.you_owe_mes ||= You_owe_me.new
    1.times { expense.you_owe_mes.build }
    expense
  end

end
