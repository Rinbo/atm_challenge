class Account
    attr_accessor :pin_code

    def initialize
        generate_pin
    end

    private

    def generate_pin
        @pin_code=rand(1000..9999)
    end
end