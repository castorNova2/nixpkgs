{
  lib,
  stdenv,
  fetchFromGitea,
  autoreconfHook,
  autoconf-archive,
  pkg-config,
  SDL2,
  openal,
  alure,
  nix-update-script,
}:

stdenv.mkDerivation (finalAttrs: {
  pname = "apricots";
  version = "0.2.9";

  src = fetchFromGitea {
    domain = "codeberg.org";
    owner = "moggers87";
    repo = "apricots";
    tag = "v${finalAttrs.version}";
    hash = "sha256-nIa0a1HO8sShabDWCuDgg+VvcRJbZlaZRsuJB3Dsjfc=";
  };

  nativeBuildInputs = [
    autoreconfHook
    autoconf-archive
    pkg-config
  ];

  buildInputs = [
    SDL2
    openal
    alure
  ];

    passthru.updateScript = nix-update-script { };

  meta = {
    description = "2D aerial combat game";
    homepage = "https://codeberg.org/moggers87/apricots";
    changelog = "https://codeberg.org/moggers87/apricots/releases/tag/v${finalAttrs.version}";
    mainProgram = "apricots";
    license = lib.licenses.gpl2Only;
    platforms = lib.platforms.unix;
    maintainers = with lib.maintainers; [ castorNova2 ];
  };
})
