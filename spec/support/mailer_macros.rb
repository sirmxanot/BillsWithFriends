module MailerMacros
	def last_email
		ActionMailer::Base.Deliveries.last
	end

	def reset_email
		ActionMailer::Base.Deliveries = []
	end
end
