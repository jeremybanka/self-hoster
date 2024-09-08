{
  description = "Nix flake for installing bun, fnm, gh, ddclient, and global npm packages";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
  };

  outputs = { self, nixpkgs }: {
    defaultPackage.x86_64-linux = self.packages.x86_64-linux.default;
    packages = {
      x86_64-linux = let
        system = "x86_64-linux";
        pkgs = import nixpkgs {
          inherit system;
        };
      in {
        default = pkgs.mkShell {
          buildInputs = with pkgs; [
            bun
            fnm
            ddclient
            gh
            nginx
          ];

          # Automatically use fnm and install global npm packages
          shellHook = ''
            # Initialize fnm in the shell environment
            eval "$(fnm env)"

            # Use the Node.js version specified in .nvmrc or .node-version if present
            if [ -f .nvmrc ]; then
              fnm use
            fi

            # Install global npm packages if not already installed
            global_packages="@antfu/ni"
            for pkg in $global_packages; do
                bun install -g $pkg
            done
          '';
        };
      };
    };
    devShells = {
      x86_64-linux.default = self.packages.x86_64-linux.default;
    };
  };
}
