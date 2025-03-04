git ls-remote --tags https://github.com/fstarlang/fstar.git \
    | grep -Po ".*refs/tags/\Kv\d{4}\.\d{2}\.\d{2}$" \
    | jq -R '. | select(split(".")[0] | sub("v";"") | tonumber | . >= 2025)' \
    | jq -s 'map({version: ., name: . | gsub("[.]";"_")})' > versions.json

(
    echo '{inputs = {flake-utils.url = "github:numtide/flake-utils";'
    cat versions.json | jq '.[] | "fstar_" + .name + ".url = \"github:fstarlang/fstar/" + .version + "\";"' -r
    echo "};"
    echo 'outputs = { flake-utils, nixpkgs, ... }@inputs:'
    echo 'flake-utils.lib.eachDefaultSystem (system:'
    echo '{ packages = {'
    cat versions.json | jq '.[] | ("fstar_" + .name) as $n | $n + " = inputs." + $n + ".packages.${system}.default;"' -r
    echo '}; }'
    echo ');'
    echo '}'
) > flake.nix
