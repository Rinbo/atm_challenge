require './lib/account.rb'
require 'date'

describe Account do
    
    #let(:person) { instance_double('Person', name: 'Hanna') }

    it 'check length of number' do
        number = subject.pin_code
        number_length = Math.log10(number).to_i + 1
        expect(number_length).to eq 4
    end

    it 'is expcted to have an expiry date on init' do
        expected_date = Date.today.next_year(5).strftime("%m/%y")
        expect(subject.exp_date).to eq expected_date
    end

    it 'is expected to have :active status on initialize' do
        expect(subject.account_status).to eq :active
    end

    it 'deactivates account using Instance method' do
        subject.deactivates
        expect(subject.account_status).to eq :deactivated
    end

end

