# `stl/` — Generated Meshes

All binary STL exports generated from the OpenSCAD source live here.  This directory mirrors the family structure of `scad/` so automation can write exports without additional path logic.

```
stl/
├─ chassis/
├─ axle/
└─ tires/
```

• STLs are built by the GitHub workflow—this folder may be empty in branches.
• Do **not** edit files in place; re–generate via `scripts/export.py` for local tests. 