void printInfo({String? name,String? gender})
{
  print("Hello $name, your gender is $gender");
}

void main() {
  // arguments order is important
  printInfo(gender:"male");
  printInfo(name:"John",gender:"male");
  printInfo(name:"female",gender:"Alice");
 }
