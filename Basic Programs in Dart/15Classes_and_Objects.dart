class Student
{
  String? name;
  int? age;
  int? grade;
  
  void displayInfo()
  {
    print("student name: $name");
    print("student age: $age");
    print("student grade: $grade");
  
}
}
void main()
{
  var student1 = Student();
  student1.name="Alice";
  student1.age=20;
  student1.grade=85;
  var student2 = Student();
  student2.name="Bob";
  student2.age=22;
  student2.grade=90;
  
  student1.displayInfo();
  student2.displayInfo();
}

