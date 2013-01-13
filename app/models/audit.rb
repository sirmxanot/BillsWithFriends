class Audit 
	def self.audit_math (you_owe_mes, payments) 
		audit = 0

		you_owe_mes.each do |update_audit|
      audit += update_audit.amount
    end
    
    payments.each do |update_audit|
      audit -= update_audit.total_amount
    end
    
    audit 
  end
     
end
