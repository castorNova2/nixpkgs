{
  lib,
  stdenv,
  fetchFromGitHub,
  autoreconfHook,
  libX11,
  libXpm,
  xorgproto,
}:

stdenv.mkDerivation (finalAttrs:{

  pname = "0verkill";
  version = "unstable-2011-01-13";

  src = fetchFromGitHub {

    owner = "hackndev";
    repo = "0verkill";
    rev = "522f11a3e40670bbf85e0fada285141448167968";
    hash = "sha256-WO7PN192HhcDl6iHIbVbH7MVMi1Tl2KyQbDa9DWRO6M=";
  };

  nativeBuildInputs = [
    autoreconfHook
  ];

  buildInputs = [
    libX11
    libXpm
    xorgproto
  ];

  configureFlags = [ "--with-x" ];

  # preAutoreconf = ''
  # autoupdate
  # '';
  env.NIX_CFLAGS_COMPILE = "-fcommon";

  # postInstall = ''
  #   mv $out/bin/server $out/bin/0verkill-server
  #   mv $out/bin/test_server $out/bin/0verkill-test-server
  # '';

  hardeningDisable = ["all"];

  meta = {
    description = "Bloody 2D action deathmatch-like game.";
    homepage = "https://github.com/hackndev/0verkill";
    license = lib.licenses.gpl2Only;
    platforms = lib.platforms.linux;
    maintainers = with lib.maintainers; [castorNova2];
  };
})