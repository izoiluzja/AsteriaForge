# 🔥 AsteriaForge

**A companion tool for Asteria to generate fast, field-specific star catalogues and overlays.**

---

## 🎯 Purpose

AsteriaForge is a standalone Swift app designed to:
- Generate trimmed star catalogues for user-defined fields of view (FOV)
- Export catalogues in efficient formats (JSON, SQLite, Binary)
- Support visual overlays and annotations for Asteria
- Include deep-sky objects (DSOs) such as Messier, NGC, and Sharpless

It complements Asteria by keeping data management modular and separate from image analysis.

---

## 🧠 Why a Separate App?

- ✨ Clean separation of concerns: UI/pipeline code in Asteria stays lean
- 🔄 Reusable: same catalogue builder could serve future tools
- 💻 Better UX: a setup wizard for different rigs/cameras/mounts
- 🛠️ Extensible: load any supported catalogue, convert formats, customize filtering

---

## 🛠️ Features (Phased Plan)

### ✅ Phase 1 – Star Catalogue Builder
- Load HIPPARCOS catalogue (`hip_main.dat`)
- Let user define:
  - FOV (degrees or via sensor/focal length)
  - Magnitude cutoff
- Export filtered stars to `AsteriaCatalogue.json`

### 🟡 Phase 2 – Scale Up
- Add Tycho-2 support
- Index by RA/Dec for fast lookup
- Magnitude filtering and object class filtering

### 🔮 Phase 3 – Deep-Sky Objects
- Load and export:
  - Messier
  - NGC/IC
  - Sharpless
  - Yale BSC
- Optional color/spectral overlays

---

## 🔧 Output Formats

| Format   | Description                      |
|----------|----------------------------------|
| JSON     | Easy to inspect & debug          |
| SQLite   | Indexed querying for mobile use  |
| Binary   | Max performance, min load time   |

---

## 📦 Example Output Schema (JSON)

```json
{
  "fovDegrees": 4.2,
  "maxMagnitude": 11.0,
  "stars": [
    { "id": 71683, "ra": 219.902, "dec": -60.835, "mag": 0.01 },
    { "id": 37279, "ra": 114.825, "dec": 5.225, "mag": 0.4 }
  ],
  "dsos": [
    { "name": "M42", "ra": 83.822, "dec": -5.391, "type": "Nebula" }
  ]
}
```

---

## 📁 Directory Structure

```
AsteriaForge/
├── Sources/
│   ├── CatalogueLoader.swift
│   ├── StarExporter.swift
│   └── DSOOverlayBuilder.swift
├── Resources/
│   ├── hip_main.dat
│   ├── ngc.csv
│   └── messier.csv
└── Output/
    └── catalogue_fov4.2_mag11.json
```

---

## ✨ Bonus Lore

> In mythology, **Hephaestus**, the Greek god of the forge, crafted the stars and armory for the gods.
>
> **AsteriaForge** continues that legacy — shaping the sky into a tool of precision, wonder, and discovery. 🔨🌌

---

> With AsteriaForge, we prepare the universe. Asteria just has to look up.
