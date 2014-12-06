{ pkgs }:

with pkgs;
let

  nixpkgsGit = import /home/carlo/nixpkgs {};
  # Directories where I'll store extra packages.
  normalProjectDir = "/home/carlo/code/nix-packaging/";
  haskellProjectDir = normalProjectDir + "haskell-packaging/";

  # Wrap callPackage with the default Haskell directories.
  haskellPackage = s: p: s.callPackage (haskellProjectDir + p) {};
  haskellPackageS = s: p: s.callPackage (haskellProjectDir + p);
  normalPackage = p: callPackage (normalProjectDir + p) {};
  normalPackage32 = p: callPackage_i686 (normalProjectDir + p) {};

  # Wrap callPackage with the default non-Haskell directories.
  normalPackageS = s: p: s.callPackage (normalProjectDir + p) {};

  nixpkgsTop = "/home/carlo/nixpkgs/pkgs/";
  nixpkgsNorm = p: pkgs.callPackage (nixpkgsTop + p);

  nixpkgsHask = "/home/carlo/nixpkgs/pkgs/development/libraries/haskell/";
  nixpkgHaskell = s: p: s.callPackage (nixpkgsHask + p) {};

  buildLocally = pk: p: pk.lib.overrideDerivation p (attrs: { buildInputs = []; preferLocalBuild = true; });
  buildAllLocally = pk: pk.lib.attrsets.mapAttrs (n: v: buildLocally pk v);

in
{ allowUnfree = true;
  packageOverrides = self: rec {

  # Haskell packages I want to use that reside out of nixpkgs or don't
  # have the settings I want.
  ownHaskellPackages = ver : recurseIntoAttrs (ver.override {
    extension = se : su : rec {
      musicDynamicsLiteral = normalPackageS se "music-dynamics-literal";
      musicPitchLiteral = normalPackageS se "music-pitch-literal";
      prettify = normalPackageS se "prettify";
      lilypond = normalPackageS se "lilypond";
      reverseApply = normalPackageS se "reverse-apply";
      musicxml2 = normalPackageS se "musicxml2";
      typeUnary = normalPackageS se "type-unary";
      applicativeNumbers = normalPackageS se "applicative-numbers";
      ty = normalPackageS se "ty";
      abcnotation = normalPackageS se "abcnotation";
      #musicPitch = normalPackageS se "music-pitch";
      dataInterval = normalPackageS se "data-interval";
      extendedReals = normalPackageS se "extended-reals";
    };
  });

  # This is similar to ownHaskellPackages except that it uses my local
  # nixpkgs checkout as a base which means that I don't have to
  # duplicate some expressions and wait for the channel to catch up.
  ownHaskellPackagesGit = ver : nixpkgsGit.recurseIntoAttrs (ver.override {
    extension = se : su : rec {
      # yiHaskellUtils = normalPackageS se "yi-haskell-utils";
    };
  });


  # Derive package sets for every version of GHC I'm interested in.
  myHaskellPackages_ghc742 = ownHaskellPackages haskellPackages_ghc742;
  myHaskellPackages_ghc763 = ownHaskellPackages haskellPackages_ghc763;
  myHaskellPackages_ghc783 = ownHaskellPackages haskellPackages_ghc783;
  myHaskellPackages_ghc783_profiling =
    ownHaskellPackages haskellPackages_ghc783_profiling;

  myHaskellPackages = myHaskellPackages_ghc783;
  myHaskellPackages_profiling = myHaskellPackages_ghc783_profiling;

  myHaskellPackages_ghc783_nixpkgs = ownHaskellPackagesGit nixpkgsGit.haskellPackages_ghc783;
  myHaskellPackages_nixpkgs = myHaskellPackages_ghc783_nixpkgs;
  };
}
