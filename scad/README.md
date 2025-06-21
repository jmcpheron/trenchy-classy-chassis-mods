# `scad/` — OpenSCAD Source

This directory contains **all editable, text-based CAD files** for the project.

Sub-folders mirror the functional families of the build so that export scripts can map `scad/<family>/foo.scad` ➜ `stl/<family>/foo_*.stl` automatically.

```
scad/
├─ core/      # shared utilities (threads, fasteners, measurements)
├─ chassis/   # parametric chassis bodies
├─ axle/      # axle & hub generators (magnet or press-fit)
└─ tires/     # TPU and rigid tyre variants
```

Add new `.scad` files in the correct sub-folder.  Use **lower-case file names** and describe key parameters in the file header comment block.
