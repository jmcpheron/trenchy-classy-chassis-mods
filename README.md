# Trenchy Classy Chassis Mods

A modular, remix-friendly library of OpenSCAD parts (chassis, axles, wheels, rubber tyres) for the Trenchy 1:64 scale truck ecosystem. **This is a community fork of the open-source [3DTrenchy 'print-in-place truck' project](https://makerworld.com/en/models/1403367-3dtrenchy-print-in-place-truck?from=search#profileId-1455835).**

This repository now follows an **asset-type–first** layout.  Editable CAD lives in `scad/`, generated meshes in `stl/`, docs in `docs/`, and so on.  The goal is to keep the source lightweight while making automation and collaboration easy.

---

## 📡 Upstream Inspiration
* Original model & files: [MakerWorld – 3DTrenchy Print-in-Place Truck](https://makerworld.com/en/models/1403367-3dtrenchy-print-in-place-truck?from=search#profileId-1455835)
* Announcement & overview video on YouTube: [youtu.be/zc_4vQl6kY4](https://www.youtube.com/watch?v=zc_4vQl6kY4)

3DTrenchy is released under its own license terms as specified by the author; please review those before redistributing or remixing their assets.  This repository re-implements and extends the concept in a parametric, part-library style—no upstream STLs are bundled here.

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
├─ stl/                 ← CI-generated meshes (not committed)
│   ├─ chassis/
│   ├─ axle/
│   ├─ rims/
│   └─ tires/
│
├─ images/              ← renders & reference photos used in docs
├─ docs/                ← markdown pages (GitHub Pages ready)
├─ vendor/              ← third-party STLs / reference CAD (read-only)
├─ scripts/             ← build & utility helpers (see below)
└─ README.md            ← this file
```

### Naming Rules
1. Folder names: **lowercase**, single word.
2. File names: `partname_[param].scad` → `partname_[param]_[layers].stl`.
3. Experimental/WIP models: suffix `_proto` and they will be skipped by CI export.

---

## 🛠 Build / Export Workflow

An automated GitHub Actions workflow (`.github/workflows/build-stl.yml`) renders all `.scad` files inside `scad/` to mirrored paths in `stl/` on every push or pull request.  The workflow also uploads the STLs as build artifacts and, when changes are detected on the `main` branch, commits the fresh meshes back to the repository.

If you need a quick local test you can still run OpenSCAD directly:

```bash
openscad -o stl/chassis/my_part.stl scad/chassis/my_part.scad
```

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

## 🤝 Contributing
1. Fork and clone the repo.
2. Add new OpenSCAD in the correct `scad/<category>/` folder.
3. Optionally preview your SCAD locally with OpenSCAD; **do not commit STL files**—the CI workflow generates them.
4. Open a pull request—screenshots encouraged!

---

## 📄 License

This repository is released under the [MIT License](LICENSE).  The original 3DTrenchy project retains its own separate license.

---
*Part of the community-driven Trenchy ecosystem – because every truck needs classy wheels!*