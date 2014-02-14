module Validators
  class SnapCiValidator

    attr_reader :errors
    attr_accessor :request_info

    def is_valid?
      validator = setup_hash_validator
      @errors = validator.errors
      return validator.valid?
    end

    private

    def setup_hash_validator
      validations = get_hash_validations
      return HashValidator.validate(request_info, validations)
    end

    def get_hash_validations
      return { "monitor"=> { "stage_name"=> "string", "build_result"=>"string" } }
    end

  end
end
