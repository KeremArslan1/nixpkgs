final: prev: {
  lib = prev.lib // rec {
    # Other
    OS =
      if prev.stdenv.isDarwin then
        "macOS"
      else
        builtins.elemAt (builtins.match "NAME=\"?([A-z]+)\"?.*" (builtins.readFile /etc/os-release)) 0;
  };
}
