class ATM
    attr_accessor :funds
    
    def initialize
        @funds = 1000
    end   

    def withdraw(amount, pin_code, account)
        case
        when account_status_disabled?(account.account_status)
            return { 
                status: false, 
                message: 'account disabled', 
                date: Date.today
                }
        when incorrect_pin?(pin_code, account.pin_code)
            return { 
                status: false, 
                message: 'Incorrect pin', 
                date: Date.today
                }
        when card_expired?(account.exp_date)
            return { 
                status: false, 
                message: 'card expired', 
                date: Date.today
                }
        when insufficient_funds_in_account?(amount, account)
            return { 
                status: false, 
                message: 'insufficient funds', 
                date: Date.today
                } 
        when insufficient_funds_in_atm?(amount)
            return { 
                status: false, 
                message: 'insufficient funds in ATM', 
                date: Date.today
                } 
        else
            perform_transaction(amount, account)
        end
    end


    private

    def insufficient_funds_in_account?(amount, account)
        amount > account.balance
    end

    def insufficient_funds_in_atm?(amount)
        @funds < amount
    end

    def perform_transaction(amount, account)
        @funds -= amount
        account.balance -= amount
        return  { status: true, message: 'success', date: Date.today, amount: amount }
    end

    def incorrect_pin?(pin_code, account_pin)
        pin_code != account_pin
    end
    
    def card_expired?(exp_date)
        Date.strptime(exp_date, '%m/%y') < Date.today
    end

    def account_status_disabled?(account_status)
        account_status == :disabled
    end
end