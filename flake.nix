{
  description = "Let's self-host a TypeScript application";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs";
  };

  outputs = { self, nixpkgs }: let
    systems = [ "x86_64-linux" "x86_64-darwin" "aarch64-linux" "aarch64-darwin" ]; # Support ARM (aarch64) and x86_64 for Linux and macOS
  in {
    packages = nixpkgs.lib.genAttrs systems (system: let
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
          system-sendmail
        ];

        shellHook = ''
          eval "$(fnm env)"

          if [ -f .nvmrc ]; then
            fnm use
          fi

          bun upgrade

          global_packages="@antfu/ni"
          for pkg in $global_packages; do
              bun install -g $pkg
          done

          export PATH="$HOME/.bun/bin:$PATH"
        '';
      };
    });
    
    devShells = nixpkgs.lib.genAttrs systems (system: self.packages.${system});
  }; 
}
