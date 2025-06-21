# Trenchy Classy Chassis Mods

A modular, remix-friendly library of OpenSCAD parts (chassis, axles, wheels, rubber tyres) for the Trenchy 1:64 scale truck ecosystem.

This repository now follows an **asset-type–first** layout.  Editable CAD lives in `scad/`, generated meshes in `stl/`, docs in `docs/`, and so on.  The goal is to keep the source lightweight while making automation and collaboration easy.

---

## 📁 Repo Layout

```
.
├─ scad/                ← all editable OpenSCAD source
│   ├─ core/            ← bolts, screws, helper modules
│   ├─ chassis/         ← parametric chassis models
│   ├─ axle/            ← standard & magnet axle generators
│   └─ tires/           ← plastic & TPU tyre models
│
├─ stl/                 ← auto-exported meshes (binary, tracked with Git LFS)
│   ├─ chassis/
│   ├─ axle/
│   └─ tires/
│
├─ images/              ← renders & reference photos used in docs
├─ docs/                ← markdown pages (GitHub Pages ready)
├─ vendor/              ← third-party STLs / reference CAD (read-only)
├─ scripts/             ← build & utility helpers (see below)
├─ .gitattributes       ← Git LFS configuration
└─ README.md            ← this file
```

### Naming Rules
1. Folder names: **lowercase**, single word.
2. File names: `partname_[param].scad` → `partname_[param]_[layers].stl`.
3. Experimental/WIP models: suffix `_proto` and they will be skipped by CI export.

---

## 🛠 Build / Export Workflow

A cross-platform script in `scripts/export.py` walks every `.scad` file and exports STLs into the mirrored path under `stl/`.

```bash
python3 scripts/export.py            # export all production parts
python3 scripts/export.py --wip      # include *_proto files
```

Under the hood it calls OpenSCAD headlessly:

```bash
openscad -o stl/chassis/chassis_v2_0.2mm.stl \
         -D export=true -D layer_height=0.2 \
         scad/chassis/chassis_v2.scad
```

The script injects common build parameters so every export is consistent.

### Recommended Print Settings
* Nozzle ⌀: **0.4 mm**  (0.2 mm for fine axles)
* Layer height: **0.2 mm** (tires: 0.16 mm TPU)
* Material:
  * PLA for chassis & hubs
  * TPU 95A for rubber tyres
  * PETG recommended for magnet axles
* Infill: 20 % gyroid (solid tyres 100 %)
* Walls/top/bottom: 3 / 3 / 3
* Supports: disabled (all models print support-free)

---

## 📜 Git LFS Setup
Binary artefacts are large; track them via Git LFS:

```
# .gitattributes
*.stl  filter=lfs diff=lfs merge=lfs -text
*.png  filter=lfs diff=lfs merge=lfs -text
*.jpg  filter=lfs diff=lfs merge=lfs -text
```

Install once per clone:
```bash
git lfs install
```

---

## 🤝 Contributing
1. Fork and clone with Git LFS enabled.
2. Add new OpenSCAD in the correct `scad/<category>/` folder.
3. Run `scripts/export.py` and commit both SCAD + generated STL.
4. Open a pull request—screenshots encouraged!

---

## 📄 License
Everything in `scad/` is released under the **CERN-OHL-S** (strongly reciprocal) license.  Vendor parts keep their original licenses.

---

*Part of the community-driven Trenchy ecosystem - because every truck needs classy wheels!*