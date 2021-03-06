{
  description = ''Wrapper for Horde3D, a small open source 3D rendering engine.'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs."horde3d-master".dir   = "master";
  inputs."horde3d-master".owner = "nim-nix-pkgs";
  inputs."horde3d-master".ref   = "master";
  inputs."horde3d-master".repo  = "horde3d";
  inputs."horde3d-master".type  = "github";
  inputs."horde3d-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."horde3d-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib"];
  in lib.mkProjectOutput {
    inherit self nixpkgs;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
    refs = builtins.removeAttrs inputs args;
  };
}