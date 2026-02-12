# Mixcuref.Meta

**Mixcuref.Meta** is a thin *meta-layer* R package that provides a unified front-end interface for fitting **mixture cure models**, while delegating all estimation to specialised engine packages.

The package does **not** re-implement likelihoods or optimization routines. Instead, it standardizes:  
- model specification,  
- engine selection,  
- and downstream interaction with fitted objects.  

Each engine package remains **fully installable and usable on its own**.

---

## Supported engines

`Mixcuref.Meta` currently supports the following engine packages:

- **mixcuref**
  Firth-type penalized likelihood (FT-PL) estimation for mixture cure models (e.g. `mixcure.penal.est()`).
  Robust profile likelihood-based confidence interval and likelihood ratio test under FT-PL (e.g. `mixcure.penal.profile.CI()`, `mixcure.penal.1d.nested.lrt()`) 

- **ClipMixcure**
  Robust combined likelihood profile-based inference under FT-PL for multiply imputed data (e.g. `mixcure.penal.mi()`, `clip.mixcure()`).

- **mixcuref.cr**
  Bivariate confiden region estimation of mixcure cure models (e.g. `mixcure.penal.polar.plcr()`).

The meta-layer provides a *single entry point* while preserving the full functionality of each engine.

---

## Installation

### Install meta-layer package

remotes::install_github("https://github.com/ChangchangXu-LTRI2025/mixcuref.meta")

### Automatically installed engine packages include (individually usable)

remotes::install_github("https://github.com/ChangchangXu-LTRI2025/mixcuref")  
remotes::install_github("https://github.com/ChangchangXu-LTRI2025/ClipMixcure")  
remotes::install_github("https://github.com/ChangchangXu-LTRI2025/mixcuref.cr")  
