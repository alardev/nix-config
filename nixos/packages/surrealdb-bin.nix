# /etc/nixos/packages/surrealdb-bin.nix 
{ stdenv, fetchzip, autoPatchelfHook, glibc, gcc-unwrapped }: stdenv.mkDerivation rec {
  pname = "surrealdb-bin";
  version = "2.0.0-alpha.6";

  src = fetchzip {
    url = "https://github.com/surrealdb/surrealdb/releases/download/v${version}/surreal-v${version}.linux-amd64.tgz";
    hash = "sha256-ymDKJS+pcp1lqexdCbFMD+TbxzQlZO62RJYci4vaUl4=";
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

