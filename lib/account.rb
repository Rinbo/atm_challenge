class Account
    STANDARD_VALIDITY_YRS = 5
    attr_accessor :pin_code, :exp_date, :account_status, :owner

    def initialize(attrs = {})
        generate_pin
        set_expire_date
        set_owner(attrs[:owner])        
        @account_status = :active        
    end

    def set_expire_date
        @exp_date = Date.today.next_year(Account::STANDARD_VALIDITY_YRS).strftime('%m/%y')
    end

    def deactivates
        @account_status = :deactivated
    end

    private

    def set_owner(obj)
        obj.nil? ? missing_owner : @owner = obj
    end
    
    def missing_owner
        raise ArgumentError, 'An account owner is missing'
    end

    def generate_pin
        @pin_code=rand(1000..9999)
    end
end