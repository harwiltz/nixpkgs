{ lib
, buildPythonPackage
, fetchFromGitHub
, absl-py
, toolz
, dm-tree
, jax
, jaxlib
}:

buildPythonPackage rec {
  pname = "chex";
  version = "0.1.0";
  
  disabled = pythonOlder "3.7";

  src = fetchFromGitHub {
    owner = "deepmind";
    repo = pname;
    rev = "v${version}";
    sha256 = "sha256-V8zQ9PWLvW+sG1K6893uX62XFx8l+pB7AOqBFZd+Y0Q=";
  };

  propagatedBuildInputs = [
    absl-py
    jax
    jaxlib
    dm-tree
    toolz
  ];

  pythonImportsCheck = [ "chex" ];

  meta = with lib; {
    description = "Python library for helping to write JAX code";
    homepage = "https://chex.readthedocs.io";
    license = licenses.asl20;
    maintainers = with maintainers; [ harwiltz ];
  };
}
