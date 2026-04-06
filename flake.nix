{
  description = "JulienKhlt's dotfiles managed with Nix + home-manager";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { nixpkgs, home-manager, ... }:
    let
      # Add more systems as needed
      supportedSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;
    in
    {
      homeConfigurations = {
        # Default profile — adjust "julien.khlaut" to your username
        # Usage: home-manager switch --flake .#julien.khlaut
        "julien.khlaut" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          modules = [ ./nix/home.nix ];
          extraSpecialArgs = {
            username = "julien.khlaut";
            homeDirectory = "/home/julien.khlaut";
          };
        };

        # macOS profile example
        # Usage: home-manager switch --flake .#julien-macos
        "julien-macos" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.aarch64-darwin;
          modules = [
            ./nix/home.nix
            ./nix/macos.nix
          ];
          extraSpecialArgs = {
            username = "julien.khlaut";
            homeDirectory = "/Users/julien.khlaut";
          };
        };
      };

      # Convenience: `nix develop` gives you a shell with home-manager available
      devShells = forAllSystems (system:
        let pkgs = nixpkgs.legacyPackages.${system};
        in {
          default = pkgs.mkShell {
            packages = [ home-manager.packages.${system}.default ];
          };
        }
      );
    };
}
