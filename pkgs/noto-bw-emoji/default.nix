{ lib, stdenvNoCC }:
let
  pname = "noto-fonts-bw-emoji";
  version = "v39";
  font-family-name = "Noto Emoji";
in
stdenvNoCC.mkDerivation {
  pname = "noto-fonts-bw-emoji";
  inherit version font-family-name;

  src = fetchurl {
    src = "http://fonts.gstatic.com/s/notoemoji/v39/bMrnmSyK7YY-MEu6aWjPDs-ar6uWaGWuob-r0jwvS-FGJCMY.ttf";
    sha256 = "65fc21f6ad86acbe43c29f89ffc0dd77621709a517a50edd1370aa80230cc8fb";
  };

  passthru = {
    updateScript = ./update.sh;
  };

  enableParallelBuilding = true;

  installPhase = ''
    runHook preInstall
    mkdir -p $out/share/fonts/noto
    cp *.ttf $out/share/fonts/noto
    runHook postInstall
  '';

  meta = with lib; {
    description = "Black-and-White emoji fonts";
    homepage = "https://fonts.google.com/noto/specimen/Noto+Emoji";
    license = with licenses; [ asl20 ];
    platforms = platforms.all;
  };
}
