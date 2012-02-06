class Audit 
	def self.audit_math (you_owe_me, i_paid_you) 
		audit = 0

		you_owe_me.each do |update_audit|
      audit += update_audit.amount
    end
    
    i_paid_you.each do |update_audit|
      audit -= update_audit.amount
    end
    
    audit 
  end
     
end
