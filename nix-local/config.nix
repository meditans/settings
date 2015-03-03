{ pkgs }: {
  allowBroken = true;
  allowUnfree = true;

  haskellPackageOverrides = self: super: {
    ghci-ng = self.callPackage /home/meditans/source/haskell/ghci-ng/default.nix {};
    helios = self.callPackage /home/meditans/code/haskell/helios/default.nix {};
  };

  packageOverrides = pkgs: with pkgs; rec {

    haskellEnv = haskellngPackages.ghcWithPackages cabalPackages;

    cabalPackages = hp: with hp; [
      cabal2nix
      cabal-install-bundle
      stylish-haskell
      ghc-mod
      hindent
      haskell-docs

      hi
      # subtitleParser
      # aeson
      # turtle
      # foldl

      # gloss
      # Hipmunk
      # QuickCheck
      # quickcheck-instances
      # list-extras
      # primes
      # data-ordlist
    ];

    # latexEnv = pkgs.texLiveAggregationFun {paths = [
    #   texLive
    #   texLiveExtra
    #   texLiveBeamer
    #   texLiveCMSuper
    # ];};
  };
}
