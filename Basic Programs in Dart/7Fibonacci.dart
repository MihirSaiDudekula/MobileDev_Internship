void main(){
  List a=[];
  a[0]=1;
  a[1]=1;
  int sum=0;
  for(int i=2;i<12;i++)
  {
    sum=(a[i-1]+a[i-2]);
    a.add(sum);
  }
  print(a);
}
