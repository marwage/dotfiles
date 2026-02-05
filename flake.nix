{
  description = "Marcel's environment";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { self, nixpkgs, flake-utils }:
    flake-utils.lib.eachDefaultSystem (system:
      let
        pkgs = import nixpkgs {
          inherit system;
          config.allowUnfree = true;
        };
      in
      {
        formatter = pkgs.nixpkgs-fmt;

        devShells.default = pkgs.mkShell {
          packages = with pkgs; [
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
            bat
            delta
            btop
            procs
            zoxide
            duf
            lazygit
            starship
            pay-respects

            # --- Python ---
            python3
            uv
            ruff
            ty

            # --- AI ---
            claude-code
            opencode
            cursor-cli
          ];

          shellHook = ''
            # 1. Setup Dynamic Linker paths (Critical for Python libraries like NumPy/Pandas)
            export LD_LIBRARY_PATH="${pkgs.lib.makeLibraryPath [
              pkgs.stdenv.cc.cc.lib
              pkgs.zlib
            ]}:$LD_LIBRARY_PATH"

            # 2. Inform tools which shell we want (optional, but good for some apps)
            export SHELL=${pkgs.zsh}/bin/zsh

            echo "❄️  Marcel's Dev Environment Loaded!"
          '';
        };
      }
    );
}
