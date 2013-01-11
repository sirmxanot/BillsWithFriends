module ApplicationHelper
	def link_to_remove_fields(name, f)
		f.hidden_field(:_destroy) + link_to_function(name, "remove_fields(this)") 
	end

  def link_to_add_fields(name, f, association)
    new_object = f.object.class.reflect_on_association(association).klass.new
    fields = f.fields_for(association, new_object, :child_index => "new_#{association}") do |builder|
      render(association.to_s.singularize + "_fields", :f => builder)
    end
    link_to_function(name, "add_fields(this, \"#{association}\", \"#{escape_javascript(fields)}\")")
  end

  def bootstrap_type(type)
    case type
    when :error
      "alert-error"
    when :notice
      "alert-info"
    when :success
      "alert-success"
    else
      type.to_s
    end
  end

  def edit_decider(record)
    case record
    when Payment
      if record.user_id == current_user.id
        link_to tag("i", :class => 'icon-pencil'), edit_payment_path(record)
      end
    when Expense
      if record.user_id == current_user.id
        link_to tag("i", :class => 'icon-pencil'), edit_expense_path(record)
      end
    when User
      if record.id == current_user.id
        link_to tag("i", :class => 'icon-pencil'), edit_user_path(record)
      end
    when YouOweMe
      if record.creditor_id == current_user.id
        link_to tag("i", :class => 'icon-pencil'), edit_you_owe_me_path(record)
      end
    else
      "edit_decider doesn't work with objects of class #{record.class}"
    end
  end

  def destroy_decider(record)
    case record
    when Payment
      if record.user_id == current_user.id
        link_to tag("i", :class => 'icon-trash'), record, confirm: 'Are you sure you want to delete this item?', method: :delete
      end
    when Expense
      if record.user_id == current_user.id
        link_to tag("i", :class => 'icon-trash'), record, confirm: 'Are you sure you want to delete this item?', method: :delete
      end
    when User
      if record.id == current_user.id
        link_to tag("i", :class => 'icon-trash'), record, confirm: 'Are you sure you want to delete this item?', method: :delete
      end
    when YouOweMe
      if record.creditor_id == current_user.id
        link_to tag("i", :class => 'icon-trash'), record, confirm: 'Are you sure you want to delete this item?', method: :delete
      end
    else
      "edestroy_decider doesn't work with objects of class #{record.class}"
    end
  end
end
