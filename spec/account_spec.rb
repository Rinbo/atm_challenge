require './lib/account.rb'
require 'date'

describe Account do
    
    let(:person) { instance_double('Person', name: 'Hanna') }

    it 'check length of number' do
        number = subject.pin_code
        number_length = Math.log10(number).to_i + 1
        expect(number_length).to eq 4
    end


end

