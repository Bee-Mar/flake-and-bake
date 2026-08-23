let
  merged = { a = 1; b = 2; } // { b = 20; c = 30; };
  nested = { cfg = { debug = true; port = 80; }; } // { cfg = { port = 8080; }; };
in
{
  winner = 20;
  shallow = { port = 8080; };
}
