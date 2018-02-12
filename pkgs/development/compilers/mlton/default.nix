{ stdenv, fetchurl, fetchFromGitHub, patchelf, gmp }:
rec {
  mlton20130715 = import ./20130715.nix {
    inherit stdenv fetchurl patchelf gmp;
  };

  mlton20180207Binary = import ./20180207-binary.nix {
    inherit stdenv fetchurl gmp;
  };

  mlton20180207 = import ./from-github-source.nix {
    mltonBootstrap = mlton20180207Binary;
    version = "20180207";
    rev = "on-20180207-release";
    sha256 = "00rdd2di5x1dzac64il9z05m3fdzicjd3226wwjyynv631jj3q2a";
    inherit stdenv fetchFromGitHub gmp;
  };

  mltonHEAD = import ./from-github-source.nix {
    mltonBootstrap = mlton20180207Binary;
    version = "HEAD";
    rev = "678049ecc3204247fe9a2583c66006eab57b84ce";
    sha256 = "0nha00hff362g2bwq42idrqr30r25qvdzn2azq287ip6s0is7kfb";
    inherit stdenv fetchFromGitHub gmp;
  };
}
