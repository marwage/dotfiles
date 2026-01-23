{
  description = "Marcel's dev environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs }:
    let
      systems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forAllSystems = f: nixpkgs.lib.genAttrs systems (system: f system);
    in {
      devShells = forAllSystems (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in {
          default = pkgs.mkShell {
            buildInputs = with pkgs; [
              git
              neovim
              tmux
              mosh
              zsh
              ripgrep
              fd
              fzf
              eza
              jq
              yq
              git-lfs
              tldr
              direnv
              nix-direnv

              # Python
              python3
              uv
              ruff
              ty
            ];

            shellHook = ''
              export SHELL=${pkgs.zsh}/bin/zsh
              echo "Nix dev environment loaded!"
            '';
          };
        });
    };
}
