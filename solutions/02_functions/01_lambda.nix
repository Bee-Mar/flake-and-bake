let
  double = x: x * 2;
  addThenDouble = a: b: double (a + b);
in
{
  doubled = double 4;
  combined = addThenDouble 3 4;
}
