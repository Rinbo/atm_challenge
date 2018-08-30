require './account.rb'
require './atm.rb'
require './person.rb'
require 'date'

robin = Person.new({name: "Robin"})
robin.cash = 100
robin.create_account
robin.deposit(100)
minATM = ATM.new
robin.withdraw({amount:50, pin: robin.account.pin_code, account: robin.account, atm: minATM})