// 4.  Write a dart program to design a class ‘Account’ that stores the current balance, interest rate and account number of a bank account. Your class should provide methods to withdraw deposit and add interest to the account. The user should only be allowed to withdraw money up to some overdraft limit. If an account goes overdrawn, there is fee charged.


class Account {
  int accountNumber;
  double currentBalance;
  double interestRate;
  double overdraftLimit;
  double overdraftFee;

  Account(this.accountNumber, this.currentBalance, this.interestRate, this.overdraftLimit, this.overdraftFee);

  void deposit(double amount) {
    currentBalance += amount;
  }

  void withdraw(double amount) {
    if (amount <= currentBalance + overdraftLimit) {
      currentBalance -= amount;
      if (currentBalance < 0) {
        currentBalance -= overdraftFee;
      }
    } else {
      print('Withdrawal amount exceeds overdraft limit.');
    }
  }

  void addInterest() {
    currentBalance += (currentBalance * (interestRate / 100));
  }
}

void main() {
  Account myAccount = Account(123456, 1000, 5, -500, 50);
  myAccount.deposit(500);
  myAccount.withdraw(1500);
  myAccount.addInterest();
  print('Current Balance: \$${myAccount.currentBalance}');
}
