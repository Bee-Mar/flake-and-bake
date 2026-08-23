{ pkgs, ... }:
pkgs.hello.overrideAttrs (old: {
  postInstall = (old.postInstall or "") + ''
    echo overridden > $out/baked
  '';
})
