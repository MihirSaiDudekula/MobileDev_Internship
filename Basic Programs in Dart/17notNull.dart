class Rectangle
{
  double? length;
  double? breadth;
   
  double Area()
  {
    // ! indicates not null
    return length!*breadth!;
  }
}
void main()
{ 
  Rectangle rectangle = Rectangle();
  rectangle.length=10;
  rectangle.breadth=5;
  print("Area of rectangle is ${rectangle.Area()}");
}

