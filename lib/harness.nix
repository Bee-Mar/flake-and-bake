# The exercise harness: evaluates an exercise file, supplying `pkgs` and `lib`
# (pinned by flake.lock) if the exercise is written as a function.
#
# Plain-value exercises:      42
# Function exercises:         { pkgs, lib }: pkgs.hello
{ exercisePath }:
let
  lock = builtins.fromJSON (builtins.readFile ../flake.lock);
  locked = lock.nodes.nixpkgs.locked;
  nixpkgsSrc = builtins.fetchTarball {
    url = "https://github.com/${locked.owner}/${locked.repo}/archive/${locked.rev}.tar.gz";
    sha256 = locked.narHash;
  };
  pkgs = import nixpkgsSrc { };
  exercise = import exercisePath;
in
if builtins.isFunction exercise
then exercise { inherit pkgs; inherit (pkgs) lib; }
else exercise
