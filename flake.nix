{
  description = "Flake to set up Bun, Colima, and Docker environment for running a container";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }: flake-utils.lib.eachDefaultSystem (system:
    let
      pkgs = import nixpkgs { inherit system; };
    in
    {
      devShell = pkgs.mkShell {
        # Packages to install
        buildInputs = [
          pkgs.bun        # Bun package manager
          pkgs.colima     # Colima for Docker container management
          pkgs.docker     # Docker for running containers
        ];

        # Ensure Docker daemon is running via Colima
        shellHook = ''
          echo "Starting Colima and Docker..."
          colima start
          sudo ln -sf ${pkgs.docker}/bin/docker /usr/local/bin/docker  # Ensure Docker command works properly
        '';

        # Extra environment configuration if needed
        COLIMA_DEFAULT = "true";
      };

      # Additional NixOS configuration for services if needed
      nixosConfigurations = {
        dockerHost = pkgs.nixos.lib.nixosSystem {
          system = "x86_64-linux";
          modules = [ 
            {
              services.docker = {
                enable = true;
                socketActivation = true;
              };
            }
          ];
        };
      };
    }));
}
