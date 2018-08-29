class Account
    STANDARD_VALIDITY_YRS = 5
    attr_accessor :pin_code, :exp_date, :account_status

    def initialize
        generate_pin
        set_expire_date
        @account_status = :active
    end

    def set_expire_date
        @exp_date = Date.today.next_year(Account::STANDARD_VALIDITY_YRS).strftime('%m/%y')
    end

    def deactivates
        @account_status = :deactivated
    end

    private

    def generate_pin
        @pin_code=rand(1000..9999)
    end
end