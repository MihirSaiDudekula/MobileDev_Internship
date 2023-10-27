void calculateInterest(double principle,double rate,double time)
{
  double interest=(principle*rate*time)/100;
  print("simple interest is $interest");
}

void main() {

  double principle=5000;
  double rate=3;
  double time=3;
  calculateInterest(principle,rate,time);
}
