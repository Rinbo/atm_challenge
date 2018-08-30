## ATM challange

### Training Exercise @ Craft Academy

Create a person using the person class:
~~~
someone = Person.new({name: "Someone"})
~~~

Add some cash in pocket:
~~~
someone.cash = 100
~~~
Create an account:
~~~
someone.create_account
~~~
Deposit some money from someone's pocket into the account:
~~~
someone.deposit(100)
~~~
Create an atm:
~~~
myATM = ATM.new
~~~
Withdraw some money from the atm using the correct pin code:
~~~
someone.withdraw({amount:50, pin: someone.account.pin_code, account: someone.account, atm: myATM})
~~~
