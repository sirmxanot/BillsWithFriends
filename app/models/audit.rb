class Audit 
	def self.audit_math (you_owe_me, payment) 
		audit = 0

		you_owe_me.each do |update_audit|
      audit += update_audit.amount
    end
    
    payment.each do |update_audit|
      audit -= update_audit.total_amount
    end
    
    audit 
  end
     
end
