class ErrorBag
	class ValidationException < StandardError; end
	@@errors = []

	def self.clear
		@@errors = []
	end

	def self.addError(error)
		@@errors << error
	end

	def self.addErrors(errors)
		@@errors.concat(errors)
	end

	def self.getErrors
		@@errors
	end

end