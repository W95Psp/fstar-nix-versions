{inputs = {flake-utils.url = "github:numtide/flake-utils";
fstar_v2025_01_07.url = "github:fstarlang/fstar/v2025.01.07";
fstar_v2025_01_17.url = "github:fstarlang/fstar/v2025.01.17";
fstar_v2025_02_06.url = "github:fstarlang/fstar/v2025.02.06";
fstar_v2025_02_17.url = "github:fstarlang/fstar/v2025.02.17";
};
outputs = { flake-utils, nixpkgs, ... }@inputs:
flake-utils.lib.eachDefaultSystem (system:
{ packages = {
fstar_v2025_01_07 = inputs.fstar_v2025_01_07.packages.${system}.default;
fstar_v2025_01_17 = inputs.fstar_v2025_01_17.packages.${system}.default;
fstar_v2025_02_06 = inputs.fstar_v2025_02_06.packages.${system}.default;
fstar_v2025_02_17 = inputs.fstar_v2025_02_17.packages.${system}.default;
}; }
);
}
