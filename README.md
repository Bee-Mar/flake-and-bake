<p align="center">
  <img src="assets/nix.svg" alt="Nix snowflake logo" width="160">
</p>

# flake-and-bake 🥧

A [rustlings](https://github.com/rust-lang/rustlings)-style interactive tutorial
for the Nix language and ecosystem: language basics, functions, attrsets,
nixpkgs `lib`, derivations, writing patches, overlays, and TOML-driven flake
configuration.

## Quickstart

```console
$ nix develop   # gets you `bake` (plus jq and entr)
$ bake          # serves the first incomplete exercise, re-checks on save
```

Each exercise is a `.nix` file under `exercises/` with the lesson in a comment
block and code to fix or complete. Delete the `I AM NOT DONE` line when you
want to be checked.

## Commands

| command             | what it does                                  |
| ------------------- | --------------------------------------------- |
| `bake` / `bake watch` | interactive loop over incomplete exercises  |
| `bake check [name]` | check one exercise                            |
| `bake run all`      | check everything, show progress               |
| `bake hint [name]`  | show a hint                                   |
| `bake list`         | list exercises and status                     |

Exercise names look like `01_basics/02_let`.

## Curriculum

| chapter               | topics                                       | checked via |
| --------------------- | -------------------------------------------- | ----------- |
| `00_intro`            | the workflow                                 | `nix eval`  |
| `01_basics`           | strings, let, if, inherit                    | `nix eval`  |
| `02_functions`        | currying, attrset args, `...`/`@`, compose   | `nix eval`  |
| `03_attrsets`         | rec, `//` merge semantics, mapAttrs          | `nix eval`  |
| `04_lists_and_lib`    | map/filter, foldl', nixpkgs lib helpers      | `nix eval`  |
| `05_derivations`      | runCommand, mkDerivation, phases, `$out`     | `nix build` |
| `06_patches`          | writing patches, `patches = [...]`, overrideAttrs | `nix build` |
| `07_overlays`         | final vs prev, composing overlays            | `nix eval`  |
| `08_flakes_and_toml`  | fromTOML, TOML-driven flake config           | `nix eval`  |
| `09_laziness`         | lazy eval, trace, `or`/`?`, `with` pitfalls  | `nix eval`  |
| `10_paths_and_contexts` | paths vs strings, store copies, string contexts | both    |
| `11_callpackage`      | functionArgs, mini callPackage, makeOverridable | `nix eval` |
| `12_fixpoints`        | write `fix` and `extends` yourself           | `nix eval`  |
| `13_debugging`        | nix repl, reading eval errors                | `nix eval`  |
| `14_modules`          | evalModules, types, mkIf, priorities         | `nix eval`  |
| `15_derivation_internals` | raw builtins.derivation, nativeBuildInputs vs buildInputs | both |
| `16_auto_import`      | readDir auto-import pattern                  | `nix eval`  |
| `17_capstone`         | TOML-driven, module-validated config         | `nix eval`  |

Stuck? Reference answers live in `solutions/` — but try `bake hint` first.

## Development

`scripts/verify-solutions.sh` overlays `solutions/` onto `exercises/` in a
temp dir and runs every check — run it after adding or editing exercises.
Exercise metadata (mode, expected value, hint) lives in
`exercises/manifest.toml`, parsed by `builtins.fromTOML` — dogfooding chapter
08 from day one.
