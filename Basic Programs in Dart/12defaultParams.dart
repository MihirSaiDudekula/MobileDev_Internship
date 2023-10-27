void printInfo(String name,String gender, [String title="sir/mam"])
{
  print("Hello $title $name, your gender is $gender");
}

void main() {
  // arguments order is important
  printInfo("John","male");
  printInfo("John","male","Mr.");
  printInfo("female","Alice","Mrs.");
 }
