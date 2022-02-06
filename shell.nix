with import <nixpkgs> {};
let
  erlang = pkgs.beam_nox.interpreters.erlangR24;
  otpPackages = pkgs.beam.packagesWith erlang;
  elixir = otpPackages.elixir_1_12;
  py-packages = python-packages: with python-packages; [
    pre-commit
  ];

  python-with-packages = python3.withPackages py-packages;
in
pkgs.mkShell {
  buildInputs = [
    python-with-packages
    elixir
    pkgs.yarn
    pkgs.jq
    kubernetes-helm
  ];
  shellHook = ''
    pre-commit install
    '';
}
