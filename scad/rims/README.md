# `rims/` — Wheel Hub & Rim Designs

Parametric wheel hub designs for the Trenchy truck ecosystem, featuring various rim styles and mounting options.

## 📡 Upstream Inspiration
* Original design: [Printables – Megatrenchy Stamp Wheels](https://www.printables.com/model/1300620-megatrenchy-stamp-wheels-3dtrenchy-with-rims-and-t/files)
* These rims are inspired by the Megatrenchy stamp wheel concept, re-implemented as parametric OpenSCAD modules.

## 🛞 Current Models

### `hub-v4-dome-rims-20.scad`
A 20mm diameter wheel hub with:
* **Domed cavity** – Deep, curved interior cutout for weight reduction
* **Phillips head protrusion** – Tapered cross-shaped handle on top for easy removal
* **TPU tire mounting** – Notched rim design with bottom lip for secure tire mounting
* **Parametric sizing** – Adjustable diameter, height, and cavity dimensions

#### Key Features:
- **Disk diameter**: 20mm (configurable)
- **Total height**: 7mm base + 4mm Phillips head
- **Tire mounting**: Notched rim with 1.5mm deep grooves
- **Weight reduction**: Domed cavity with 1.5mm minimum wall thickness
- **Easy removal**: Tapered Phillips head handle

#### Print Settings:
- **Material**: PLA or PETG recommended
- **Layer height**: 0.2mm
- **Supports**: Not required
- **Infill**: 20% gyroid (or higher for strength)

## 🔧 Customization
All parameters are defined at the top of each SCAD file:
- `disk_diameter` – Overall rim diameter
- `disk_height` – Base disk thickness
- `phillips_height` – Handle protrusion height
- `rim_notch_depth` – Tire mounting groove depth
- `wall_thickness` – Minimum wall thickness for cavity

## 🚗 Compatibility
These rims are designed for:
- 1:64 scale Trenchy trucks
- TPU tire mounting (notched design)
- Standard axle mounting
- Easy assembly/disassembly with Phillips head handles 