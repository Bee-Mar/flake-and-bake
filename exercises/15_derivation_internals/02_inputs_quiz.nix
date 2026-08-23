# LESSON: The two dependency lists people mix up forever:
#   nativeBuildInputs — tools that RUN at build time, on the BUILD machine
#                       (compilers, cmake, pkg-config, code generators)
#   buildInputs       — libraries the OUTPUT links against / needs at run
#                       time, for the HOST machine (openssl, zlib, gtk)
# Same machine when building natively — but get it wrong and
# cross-compilation breaks, because each list resolves against a different
# platform's package set.
#
# TASK: Sort the dependencies. Answer each with "native" or "build".
# Expected: { cmake = "native"; openssl = "build"; pkgconfig = "native";
#             zlib = "build"; }

# I AM NOT DONE

{
  cmake = "?";
  openssl = "?";
  pkgconfig = "?";
  zlib = "?";
}
