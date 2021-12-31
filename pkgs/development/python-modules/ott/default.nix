{ lib
, fetchFromGitHub
, buildPythonPackage
, jax
, jaxlib
, absl-py
, numpy
, scipy
, flax
, matplotlib
, optax }:

buildPythonPackage rec {
  pname = "ott";
  version = "0.1.20";

  src = fetchFromGitHub {
    owner = "ott-jax";
    repo = pname;
    rev = "refs/tags/${version}";
    sha256 = "sha256-8uGF9A6qA0H3bOkEm+d9pVOUJ/fcou0z9r4EvlpWQyY=";
  };

  propagatedBuildInputs = [
    optax
    flax
    matplotlib
  ];

  pythonImportsCheck = [ "ott" ];

  meta = with lib; {
    description = ''
      JAX toolbox that bundles utilities to solve optimal transport problems
    '';
    homepage = "ott-jax.readthedocs.io";
    license = licenses.asl20;
    maintainers = with maintainers; [ harwiltz ];
  };
}
