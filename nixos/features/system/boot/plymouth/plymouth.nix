{ pkgs, theme ? "evil-nixos", ... }:

pkgs.stdenv.mkDerivation {
  pname = "plymouth-theme-${theme}";
  version = "1.0";
  
  src = ./.;  # Use the local directory as source

  installPhase = ''
    mkdir -p $out/share/plymouth/themes/${theme}
    cp -r themes/${theme}/* $out/share/plymouth/themes/${theme}/
    
    # Fix paths in the .plymouth file
    substituteInPlace $out/share/plymouth/themes/${theme}/${theme}.plymouth \
      --replace "@PLYMOUTH_THEME_PATH@" "$out/share/plymouth/themes/${theme}" \
      --replace "@@" "$out/share/plymouth/themes/${theme}"
    
    chmod +x $out/share/plymouth/themes/${theme}/*.script
  '';
}
