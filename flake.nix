{
  inputs.nixpkgs.url = "nixpkgs/f45667df53b4a4bb7b0bc0fa4fb83e8c0c51add5";

  outputs =
    { self, nixpkgs }:
    let
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
    in
    {
      formatter.x86_64-linux = pkgs.nixfmt-rfc-style;
      devShell.x86_64-linux = pkgs.mkShell {
        nativeBuildInputs = with pkgs; [
          gnumake
          (pkgs.texliveBasic.withPackages (ps: with ps; [ listings ]))
        ];
      };
    };
}
