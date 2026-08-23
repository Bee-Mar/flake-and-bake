let
  fix = f: let result = f result; in result;

  extends = overlay: base: final:
    let prev = base final;
    in prev // overlay final prev;

  base = final: {
    pname = "bake";
    version = "2.0";
    tarball = "${final.pname}-${final.version}.tar.gz";
  };

  overlay = final: prev: {
    version = "3.0";
  };
in
fix (extends overlay base)
