let
  scope = {
    flour = "flour";
    butter = "butter";
    sugar = "sugar";
    yeast = "yeast";
  };

  mkPastry = { flour, butter, freshness ? "stale" }:
    "${flour} + ${butter} (${freshness})";

  callPackage = f: extra:
    f (builtins.intersectAttrs (builtins.functionArgs f) scope // extra);
in
callPackage mkPastry { freshness = "fresh"; }
