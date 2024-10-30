{ pkgs }:
let
  utils = import ../utils { inherit pkgs; };
in
utils.mkTheme rec {
  name = "Greenify";
  src = pkgs.fetchFromGitHub {
    owner = "mahaveergurjar";
    repo = "Theme-Gallery";
    name = name;
    rev = "Greenify";
    sha256 = "sha256-5UhGEVAKCnjQ8pWZ2+zjaheWOM4lZ++5DqoUGXikNls=";
  };

  meta = {
    description = "HyDE Theme: Greenify";
    homepage = "https://github.com/mahaveergurjar/Theme-Gallery/tree/Greenify";
  };
}
