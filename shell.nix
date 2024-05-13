let pkgs = import <nixpkgs>{}; in

    pkgs.mkShell {
        packages = with pkgs; [
            lua-language-server
        ];
    }
