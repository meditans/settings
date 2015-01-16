# ~/.nixpkgs/config.nix

{
  packageOverrides = super:
  let
    self = super.pkgs;
    haskellPackagingDir = "/home/carlo/code/nix-packaging/";
    locate = pkg: haskellPackagingDir + pkg + "/default.nix";
  in
  {
    haskellDevEnv = self.haskellPackages.ghcWithPackages (p: with p; [
      # Libraries 
      QuickCheck
      basicPrelude
      cheapskate
      classyPrelude
      clay
      diagrams
      fgl
      fglVisualize
      graphviz
      hakyll
      helios
      hi
      hspec
      listExtras
      markdown
      mtl
      musicSuite
      positive
      prettify
      random
      split
      text
      transformers
      unificationFd
      unorderedContainers
      vector

      # tools
      cabalInstall
      ghcMod
    ]);

    haskellPackages = super.haskellPackages.override {
      extension = self: super: {
        abcnotation = self.callPackage (locate "abcnotation") {};
        applicativeNumbers = self.callPackage (locate "applicative-numbers") {};
        average = self.callPackage (locate "average") {};
        dataInterval = self.callPackage (locate "data-interval") {};
        extendedReals = self.callPackage (locate "extended-reals") {};
        HCodecs = self.callPackage (locate "HCodecs") {};
        helios = self.callPackage "/home/carlo/code/haskell/helios/default.nix" {}; 
        lattices = self.callPackage (locate "lattices") {};
        lilypond = self.callPackage (locate "lilypond") {};
        monadplus = self.callPackage (locate "monadplus") {};
        musicArticulation = self.callPackage (locate "music-articulation") {};
        musicDynamics = self.callPackage (locate "music-dynamics") {};
        musicDynamicsLiteral = self.callPackage (locate "music-dynamics-literal") {};
        musicParts = self.callPackage (locate "music-parts") {};
        musicPitch = self.callPackage (locate "music-pitch") {};
        musicPitchLiteral = self.callPackage (locate "music-pitch-literal") {};
        musicPreludes = self.callPackage (locate "music-preludes") {};
        musicScore = self.callPackage (locate "music-score") {};
        musicSuite = self.callPackage (locate "music-suite") {};
        musicxml2 = self.callPackage (locate "musicxml2") {};
        positive = self.callPackage "/home/carlo/code/haskell/positive/default.nix" {};
        prettify = self.callPackage (locate "prettify") {};
        reverseApply = self.callPackage (locate "reverse-apply") {};
        romanNumerals = self.callPackage (locate "roman-numerals") {};
        ty = self.callPackage (locate "ty") {};
        typeUnary = self.callPackage (locate "type-unary") {};
      };
    };
  };
}
