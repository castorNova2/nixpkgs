{
  lib,
  stdenvNoCC,
  fetchFromGithub,
}:

stdenvNoCC.mkDerivation (finalAttrs: {

  pName = "bashmaze";
  version = "unstable-2014-05-02";

  src = fetchFromGithub {
    owner = "phoemur";
    repo = "https://github.com/phoemur/bashmaze";
    rev = "eaa8007f6e9b6167e54ec8f64dc70572e88c15f2";
    hash = lib.fakeHash;
  };

  dontBuild = true;

  installPhase = ''
    runHook preInstall

    install -Dm755 bashmaze.sh $out/bin/bashmaze

    runHook postInstall
  '';

  meta = {
    description = "Maze game written completely in bash-script.";
    homepage = "https://github.com/phoemur/bashmaze";
    license = lib.licenses.unfree;
    platforms = lib.platforms.linux;
    maintainers = with lib.maintainers; [ castorNova2 ];
  };
})
