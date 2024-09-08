{
  description = "Nix flake for installing bun, fnm, gh, ddclient, and global npm packages";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
  };

  outputs = { self, nixpkgs }: let
    systems = [ "x86_64-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin" ]; # Add both ARM (aarch64) and x86_64 for Linux and macOS
  in {
    packages = forEach systems (system: let
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
    });
    devShells = forEach systems (system: self.packages.${system});
  }; 
}
