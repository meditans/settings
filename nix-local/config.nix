{ packageOverrides = pkgs: rec {
    haskellPackages =
      pkgs.recurseIntoAttrs (pkgs.haskellPackages.override {
        extension = self : super :
        let callPackage = self.callPackage;
        in {
          musicDynamicsLiteral = callPackage /home/carlo/code/nix-packaging/music-dynamics-literal/default.nix {};
          musicPitchLiteral = callPackage /home/carlo/code/nix-packaging/music-pitch-literal/default.nix {};
          prettify = callPackage /home/carlo/code/nix-packaging/prettify/default.nix {};
          lilypond = callPackage /home/carlo/code/nix-packaging/lilypond/default.nix {};
          reverseApply = callPackage /home/carlo/code/nix-packaging/reverse-apply/default.nix {};
          musicxml2 = callPackage /home/carlo/code/nix-packaging/musicxml2/default.nix {};
          typeUnary = callPackage /home/carlo/code/nix-packaging/type-unary/default.nix {};
          applicativeNumbers = callPackage /home/carlo/code/nix-packaging/applicative-numbers/default.nix {};
          ty = callPackage /home/carlo/code/nix-packaging/ty/default.nix {};
          abcnotation = callPackage /home/carlo/code/nix-packaging/abcnotation/default.nix {};
          musicPitch = callPackage /home/carlo/code/nix-packaging/music-pitch/default.nix {};
          dataInterval = callPackage /home/carlo/code/nix-packaging/data-interval/default.nix {};
          extendedReals = callPackage /home/carlo/code/nix-packaging/extended-reals/default.nix {};
          lattices = callPackage /home/carlo/code/nix-packaging/lattices/default.nix {};
          positive = callPackage /home/carlo/code/nix-packaging/positive/default.nix {};
          musicParts = callPackage /home/carlo/code/nix-packaging/music-parts/default.nix {};
          musicDynamics = callPackage /home/carlo/code/nix-packaging/music-dynamics/default.nix {};
          average = callPackage /home/carlo/code/nix-packaging/average/default.nix {};
          romanNumerals = callPackage /home/carlo/code/nix-packaging/roman-numerals/default.nix {};
          musicScore = callPackage /home/carlo/code/nix-packaging/music-score/default.nix {};
          HCodecs = callPackage /home/carlo/code/nix-packaging/HCodecs/default.nix {};
          monadplus = callPackage /home/carlo/code/nix-packaging/monadplus/default.nix {};
          musicPreludes = callPackage /home/carlo/code/nix-packaging/music-preludes/default.nix {};
          musicArticulation = callPackage /home/carlo/code/nix-packaging/music-articulation/default.nix {};
        };
      });
};}
