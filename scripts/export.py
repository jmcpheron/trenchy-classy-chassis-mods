#!/usr/bin/env python3
"""Headless OpenSCAD batch exporter.

Walks the `scad/` tree, mirrors the structure under `stl/`, and
invokes OpenSCAD CLI to generate mesh files with consistent parameters.

Usage
-----
$ python export.py [--wip] [--scad-root DIR] [--stl-root DIR]

Requirements
------------
* Python 3.9+
* OpenSCAD 2021.01 or newer available on PATH

This is only a skeleton; fill in path walking and subprocess calls as needed.
"""

import argparse
import subprocess
import sys
from pathlib import Path

DEFAULT_LAYER_HEIGHT = 0.2  # mm


def export_scad(scad_file: Path, stl_root: Path):
    relative = scad_file.relative_to(Path("scad"))
    family = relative.parts[0]

    stl_dir = stl_root / family
    stl_dir.mkdir(parents=True, exist_ok=True)

    stl_name = scad_file.stem + f"_{DEFAULT_LAYER_HEIGHT:.1f}mm.stl"
    stl_path = stl_dir / stl_name

    cmd = [
        "openscad",
        "-o", str(stl_path),
        "-D", "export=true",
        "-D", f"layer_height={DEFAULT_LAYER_HEIGHT}",
        str(scad_file)
    ]

    print("[openscad]", " ".join(cmd))
    subprocess.run(cmd, check=True)


def main(argv=None):
    parser = argparse.ArgumentParser(description="Batch export OpenSCAD to STL")
    parser.add_argument("--wip", action="store_true", help="Include *_proto files")
    parser.add_argument("--scad-root", default="scad", type=Path)
    parser.add_argument("--stl-root", default="stl", type=Path)
    args = parser.parse_args(argv)

    scad_root: Path = args.scad_root
    pattern = "*.scad" if args.wip else "[!_]*.scad"

    for scad_file in scad_root.rglob(pattern):
        if not scad_file.is_file():
            continue
        if not args.wip and scad_file.stem.endswith("_proto"):
            continue
        export_scad(scad_file, args.stl_root)

    print("Done.")


if __name__ == "__main__":
    try:
        main()
    except subprocess.CalledProcessError as exc:
        sys.exit(exc.returncode) 