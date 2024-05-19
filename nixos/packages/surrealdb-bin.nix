# /etc/nixos/packages/surrealdb-bin.nix 
{ stdenv, fetchzip, autoPatchelfHook, glibc, gcc-unwrapped }: stdenv.mkDerivation rec {
  pname = "surrealdb-bin";
  version = "1.5.0";

  src = fetchzip {
    url = "https://github.com/surrealdb/surrealdb/releases/download/v${version}/surreal-v${version}.linux-amd64.tgz";
    sha256 = "6cc8bda8bd96f4f8783a5643fece3a92bf20219b7772038ad3e9230ad9fa3b51";
  };

  nativeBuildInputs = [ autoPatchelfHook ];
  buildInputs = [ glibc gcc-unwrapped ];

  installPhase = ''
    runHook preInstall
    mkdir -p $out/bin
    install -m755 surreal $out/bin
    runHook postInstall
  '';
}

