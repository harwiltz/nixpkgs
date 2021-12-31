{ lib
, fetchFromGitHub
, buildPythonPackage
, jax
, jaxlib
, numpy
, optax
, msgpack }:

buildPythonPackage rec {
  pname = "flax";
  version = "0.3.6";

  src = fetchFromGitHub {
    owner = "google";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-WdPaEj85KYSkC5otob5rITdb2zvVrkS0rjxChOgGeH8=";
  };

  propagatedBuildInputs = [
    jax
    jaxlib
    msgpack
    optax
  ];

  postPatch = ''
    sed -i '/^\s\+"matplotlib"/d' setup.py
  '';

  pythonImportsCheck = [ "flax" ];

  # Tests require a massive amount of dependencies that otherwise wouldn't
  # all be needed by most users.
  doCheck = false;

  meta = with lib; {
    description = ''
      Neural network library for JAX that is designed for flexibility.
    '';
    homepage = "flax.readthedocs.io";
    license = licenses.asl20;
    maintainers = with maintainers; [ harwiltz ];
  };
}

