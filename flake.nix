{
  description = "A Nix Flake to install Bun, Node.js, GitHub CLI (gh), and ddclient";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }: {
    defaultPackage.x86_64-linux = self.packages.x86_64-linux;
    packages = import nixpkgs {
      system = "x86_64-linux";
    };

    packages.x86_64-linux.default = pkgs.mkShell {
      buildInputs = [
        pkgs.bun
        pkgs.nodejs
        pkgs.gh
        pkgs.ddclient
      ];
    };

    devShells = {
      x86_64-linux = pkgs.mkShell {
        buildInputs = [
          pkgs.bun
          pkgs.nodejs
          pkgs.gh
          pkgs.ddclient
        ];
      };
    };
  };
}
