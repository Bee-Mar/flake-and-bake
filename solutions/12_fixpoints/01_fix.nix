let
  fix = f: let result = f result; in result;

  package = self: {
    pname = "bake";
    version = "2.0";
    tarball = "${self.pname}-${self.version}.tar.gz";
  };
in
fix package
