# LESSON: builtins.mapAttrs transforms every value in a set:
#   builtins.mapAttrs (name: value: ...) set
# Related: builtins.attrNames, attrValues, listToAttrs, removeAttrs.
#
# TASK: Use mapAttrs to suffix every version with "-patched".
# Expected: { curl = "8.0-patched"; git = "2.44-patched"; }

# I AM NOT DONE

let
  versions = { curl = "8.0"; git = "2.44"; };
in
versions   # wrap me in a mapAttrs call
