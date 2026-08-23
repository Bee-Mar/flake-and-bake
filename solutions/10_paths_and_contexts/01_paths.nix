{
  pathType = builtins.typeOf ./data.txt;
  joined = builtins.typeOf (./mydir + "/file");
  base = builtins.baseNameOf ./sub/data.txt;
}
