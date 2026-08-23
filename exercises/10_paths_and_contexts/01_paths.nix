# LESSON: Paths are their own type — ./foo is NOT a string.
#   builtins.typeOf ./data.txt        → "path"
#   ./dir + "/file"                   → still a path
#   "${./data.txt}"                   → STRING, and the file is COPIED to the
#                                       /nix/store as a side effect!
# That copy-on-interpolation is how local sources get into builds — and how
# people accidentally copy their entire repo into the store.
#
# TASK: Fill in the answers.
# Expected: { pathType = "path"; joined = "path"; base = "data.txt"; }

# I AM NOT DONE

{
  pathType = builtins.typeOf "./data.txt";   # oops — that's a string literal!
  joined = builtins.typeOf (./mydir + "/file");
  base = builtins.baseNameOf ./sub/data.txt;
}
