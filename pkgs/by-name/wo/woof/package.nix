{
  lib,
  fetchFromGitea,
  python3,
  installShellFiles,
}:

python3.pkgs.buildPythonApplication (finalAttrs: {
  pname = "woof";
  version = "0-unstable-2026-01-14";
  format = "other";

  src = fetchFromGitea {
    domain = "codeberg.org";
    owner = "nomis";
    repo = "woof";
    rev = "95e497e5c12ccb59f8ded3edb15301551f9d2476";
    hash = "sha256-WWPxkkPNJSa8eq7OAB+P1/UM5KE/JyhV4/dGeO7htN0=";
  };

  nativeBuildInputs = [ installShellFiles ];

  dontBuild = true;

  installPhase = ''
    runHook preInstall

    install -Dm755 woof $out/bin/woof

    installManPage doc/woof.1

    runHook postInstall
  '';

  meta = {
    description = "Single file transfer via web server";
    homepage = "https://codeberg.org/nomis/woof/";
    mainProgram = "woof";
    license = lib.licenses.gpl2Plus;
    platforms = lib.platforms.unix;
    maintainers = with lib.maintainers; [ castorNova2 ];
  };
})
