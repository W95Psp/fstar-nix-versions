{inputs = {flake-utils.url = "github:numtide/flake-utils";
fstar_v2025_01_07.url = "github:fstarlang/fstar/v2025.01.07";
fstar_v2025_01_17.url = "github:fstarlang/fstar/v2025.01.17";
fstar_v2025_02_06.url = "github:fstarlang/fstar/v2025.02.06";
fstar_v2025_02_17.url = "github:fstarlang/fstar/v2025.02.17";
fstar_v2025_03_25.url = "github:fstarlang/fstar/v2025.03.25";
fstar_v2025_06_13.url = "github:fstarlang/fstar/v2025.06.13";
fstar_v2025_06_20.url = "github:fstarlang/fstar/v2025.06.20";
};
outputs = { flake-utils, nixpkgs, ... }@inputs:
flake-utils.lib.eachDefaultSystem (system:
{ packages = {
fstar_v2025_01_07 = inputs.fstar_v2025_01_07.packages.${system}.default;
fstar_v2025_01_17 = inputs.fstar_v2025_01_17.packages.${system}.default;
fstar_v2025_02_06 = inputs.fstar_v2025_02_06.packages.${system}.default;
fstar_v2025_02_17 = inputs.fstar_v2025_02_17.packages.${system}.default;
fstar_v2025_03_25 = inputs.fstar_v2025_03_25.packages.${system}.default;
fstar_v2025_06_13 = inputs.fstar_v2025_06_13.packages.${system}.default;
fstar_v2025_06_20 = inputs.fstar_v2025_06_20.packages.${system}.default;
}; }
);
}
