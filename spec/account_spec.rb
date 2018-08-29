require './lib/account.rb'
require 'date'

describe Account do
    
    let(:person) { instance_double('Person', name: 'Hanna') }
    subject { described_class.new({owner: person}) }

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

    it 'is expected to have a balance' do
        expect(subject.balance).to be_truthy
    end

    it 'deactivates account using Instance method' do
        subject.deactivates
        expect(subject.account_status).to eq :deactivated
    end

    it 'is expected to have an owner' do
        expect(subject.owner).to eq person
    end

    it 'is expected to raise error if no owner is set' do
        expect { described_class.new }.to raise_error 'An account owner is missing'
    end
end

