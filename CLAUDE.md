# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a 3D printing project focused on creating modular chassis components for "Trenchy" benchmark trucks. The project is community-driven and designed to provide parametric, customizable truck chassis modifications that can be 3D printed and assembled with minimal tools.

## Development Workflow

### Primary Technologies
- **OpenSCAD**: Used for parametric 3D model generation (source files go in `openscad/`)
- **STL/3MF**: Output formats for 3D printing (generated from OpenSCAD files)
- **Markdown**: Documentation and component specifications

### Common Commands
Since this is a 3D printing project, traditional build commands are replaced with:
- `openscad -o output.stl input.scad` - Generate STL files from OpenSCAD source
- `openscad -o output.3mf input.scad` - Generate 3MF files with metadata
- Use `chassis-testbed/` directory for rapid prototyping and fit testing

### Project Structure
- `chassis-testbed/` - Minimal components for testing fit and function
- `classic-style/` - Traditional Trenchy aesthetic components
- `magnet-axle/` - Magnetic assembly system components
- `monster-mods/` - Oversized wheel and tire compatibility
- `rubber-compat/` - TPU-friendly flexible components  
- `openscad/` - Parametric source files (.scad)

## Key Design Principles

### Modular System
Components are designed to be mixed and matched. Each component category should maintain compatibility with the core Trenchy truck specifications while offering unique functionality.

### Print-in-Place Features
- Magnetic assemblies for easy disassembly
- Press-fit connections for secure mounting
- Minimize support material requirements
- Optimize for common 3D printer capabilities

### Physical Testing
Use the `chassis-testbed/` directory for rapid iteration. Components should be designed for quick printing and testing before finalizing in their respective categories.

## File Organization
- Source files (.scad) belong in `openscad/`
- Generated models (.stl, .3mf) should be organized by component category
- Each component directory should maintain its own README.md with specifications
- Document printing settings and assembly instructions alongside model files