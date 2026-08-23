let
  x = 1;
  scope1 = { x = 2; y = 20; };
  scope2 = { y = 30; };
in
{
  a = with scope1; x;               # 1 — let-bound x beats with
  b = with scope1; with scope2; y;  # 30 — inner with beats outer
  answerKey = "done";
}
