<h1 align="center">Fit qT1 models using mrQ</h1>

<p align="center">
  Quantitative T1 and related tissue maps from SPGR and SEIR acquisitions, aligned to a reference T1w image, with mrQ.
</p>

<p align="center">
  <a href="https://github.com/brainlife/abcd-spec"><img src="https://img.shields.io/badge/ABCD_Spec-v1.1-green.svg" alt="ABCD Spec v1.1"></a>
  <a href="https://doi.org/10.25663/brainlife.app.481"><img src="https://img.shields.io/badge/Brainlife-brainlife.app.481-blue.svg" alt="Run on brainlife.io"></a>
  <a href="LICENSE"><img src="https://img.shields.io/badge/License-MIT-lightgrey.svg" alt="MIT license"></a>
</p>

## 🧠 At a glance

<!-- brainlife-app:begin (generated from the App manifest; edit the manifest, not this block) -->

> **Fits quantitative T1 (qT1) and related tissue maps from SPGR and SEIR acquisitions with mrQ (Mezer et al. 2013), aligned to a reference T1w image.**

Calls mrQ_run (compiled MATLAB) on the SPGR and SEIR raw directories with the acquisition parameters given as parameters (TR, TE, flip angles, inversion times, field strength) and the reference T1w image. Use it to compute quantitative T1 and macromolecular tissue volume maps. Needs SPGR and SEIR data and their acquisition parameters. This branch has no main script, so it cannot run as published.

| | |
|---|---|
| 📥 **Inputs** | `raw` ×2 · `neuro/anat/t1w` |
| 📤 **Outputs** | `raw` |
| 🔗 **Run it** | [doi.org/10.25663/brainlife.app.481](https://doi.org/10.25663/brainlife.app.481) |

#### 📥 Inputs

| Input | Datatype | Required | Description |
|---|---|---|---|
| `spgr` | `raw` (spgr) | yes | Directory of spoiled gradient echo (SPGR) images at multiple flip angles. |
| `seir` | `raw` (seir) | yes | Directory of spin-echo inversion recovery (SEIR) images. |
| `refImage` | `neuro/anat/t1w` | yes | Reference T1w image that mrQ aligns the outputs to. |

#### 📤 Outputs

| Output | Datatype | Description |
|---|---|---|
| `results` | `raw` | mrQ output directory with the fitted quantitative maps. |

<details>
<summary><b>⚙️ Parameters</b> (12)</summary>

| Parameter | Type | Default | Description |
|---|---|---|---|
| `spgr_name` | string |  | Space-separated names of the SPGR image files. |
| `seir_name` | string |  | Space-separated names of the SEIR image files. |
| `antsThrs` | number | `0.8` | Value passed to mrQ QuantAntsThresh. |
| `autoacpc` | number | `0` | Value passed to mrQ autoacpc (automatic ACPC alignment). |
| `shiftB1` | number | `0` | Value passed to mrQ ShiftB1. |
| `spgr_tr` | string |  | Repetition time(s) of the SPGR images. |
| `seir_tr` | string |  | Repetition time(s) of the SEIR images. |
| `spgr_te` | string |  | Echo time(s) of the SPGR images. |
| `seir_te` | string |  | Echo time(s) of the SEIR images. |
| `spgr_flipangle` | string |  | Flip angles of the SPGR images, space-separated. |
| `spgr_fieldstrength` | string |  | Magnetic field strength for the SPGR data. |
| `seir_it` | string |  | Inversion times of the SEIR images, space-separated. |

</details>

<!-- brainlife-app:end -->

> [!WARNING]
> This repository does not yet contain the `main` launcher that brainlife.io runs, so the App cannot run as published. The compiled MATLAB program it would call is in `compiled/`.

## 🚀 Running the App

### ☁️ On brainlife.io

The App is registered at [doi.org/10.25663/brainlife.app.481](https://doi.org/10.25663/brainlife.app.481). It fits a quantitative model to qT1 data with [mrQ](https://github.com/mezera/mrQ), following the methods of Mezer et al. (2013), and is meant to compute quantitative T1 and macromolecular tissue volume maps.

**Inputs**

- **SPGR** (`raw`, tagged `spgr`): directory of spoiled gradient echo images at multiple flip angles.
- **SEIR** (`raw`, tagged `seir`): directory of spin-echo inversion recovery images.
- **Reference image** (`neuro/anat/t1w`): the T1w image that mrQ aligns the outputs to.

**Acquisition parameters** (space-separated lists, one value per image)

- `spgr_name`, `seir_name`: names of the SPGR and SEIR image files.
- `spgr_tr`, `spgr_te`, `spgr_flipangle`, `spgr_fieldstrength`: repetition time, echo time, flip angle and field strength of the SPGR images.
- `seir_tr`, `seir_te`, `seir_it`: repetition time, echo time and inversion time of the SEIR images.

**mrQ options**

- `antsThrs` (default 0.8): passed to mrQ `QuantAntsThresh`.
- `autoacpc` (default 0): passed to mrQ `autoacpc` (automatic ACPC alignment).
- `shiftB1` (default 0): passed to mrQ `ShiftB1`.

### 💻 Locally

`mrQBrainlife.m` reads `config.json` from the working directory and calls `mrQ_run`. It is compiled with `compile.sh` (MATLAB R2017a, with vistasoft, SPM, jsonlab, mrQ and knkutils on the path); the compiled program needs the [MATLAB Runtime R2017a (v92)](https://www.mathworks.com/products/compiler/matlab-runtime.html).

1. Clone this repository.
2. Create `config.json` with the paths to your inputs and the acquisition parameters:

   ```json
   {
       "spgr": "/input/spgr/",
       "seir": "/input/seir/",
       "refImage": "/input/refImage/t1.nii.gz",
       "spgr_name": "spgr",
       "seir_name": "seir",
       "antsThrs": 0.8,
       "autoacpc": 0,
       "shiftB1": 0,
       "spgr_tr": "0.1 0.1 0.1",
       "seir_tr": "0.1 0.1 0.1",
       "spgr_te": "0.1 0.1 0.1",
       "seir_te": "0.1 0.1 0.1",
       "spgr_flipangle": "45 45 45",
       "spgr_fieldstrength": "3 3 3",
       "seir_it": "1 1 1"
   }
   ```

3. Run the compiled program with the path to your MATLAB Runtime:

   ```bash
   ./compiled/run_mrQBrainlife.sh /path/to/MATLAB_Runtime/v92
   ```

If you have MATLAB, you can instead run `mrQBrainlife` with [mrQ](https://github.com/mezera/mrQ), [vistasoft](https://github.com/vistalab/vistasoft), [SPM](https://www.fil.ion.ucl.ac.uk/spm/software/spm12/), [jsonlab](https://github.com/fangq/jsonlab) and [knkutils](https://github.com/cvnlab/knkutils) on the path.

## 📦 Outputs

```text
results/   mrQ output directory with the fitted quantitative maps (raw datatype, tagged mrq and qt1)
```

## 📚 Citing

> [!TIP]
> If you use this App in your work, please cite the App, the software it builds on and brainlife.io (below). GitHub's **Cite this repository** button gives the App citation in APA and BibTeX.

- Mezer A, Yeatman JD, Stikov N, et al. Quantifying the local tissue volume and composition in individual brains with magnetic resonance imaging. *Nature Medicine* 19:1667–1672 (2013). [doi:10.1038/nm.3390](https://doi.org/10.1038/nm.3390)
- Avesani P, McPherson B, Hayashi S, et al. The open diffusion data derivatives, brain data upcycling via integrated publishing of derivatives and reproducible open cloud services. *Scientific Data* 6:69 (2019). [doi:10.1038/s41597-019-0073-y](https://doi.org/10.1038/s41597-019-0073-y)
- Fit qT1 models using mrQ. brainlife.io App. [doi:10.25663/brainlife.app.481](https://doi.org/10.25663/brainlife.app.481)
- Hayashi S, Caron BA, Heinsfeld AS, et al. brainlife.io: a decentralized and open-source cloud platform to support neuroscience research. *Nature Methods* 21:809–813 (2024). [doi:10.1038/s41592-024-02237-2](https://doi.org/10.1038/s41592-024-02237-2)

## 👥 Authors

- Brad Caron

**Contributors:** Soichi Hayashi

## 💰 Funding

[![Wellcome-226486/Z/22/Z](https://img.shields.io/badge/Wellcome-226486%2FZ%2F22%2FZ-purple.svg)](https://wellcome.org/)
[![NIH-NINDS-U24NS140384](https://img.shields.io/badge/NIH_NINDS-U24NS140384-green.svg)](https://reporter.nih.gov/project-details/11261037)
[![NIH-NINDS-UM1NS132207](https://img.shields.io/badge/NIH_NINDS-UM1NS132207-green.svg)](https://reporter.nih.gov/project-details/11411328)
[![NIH-NIBIB-R01EB029272](https://img.shields.io/badge/NIH_NIBIB-R01EB029272-green.svg)](https://reporter.nih.gov/project-details/10262925)
[![NIH-NIBIB-R01EB030896](https://img.shields.io/badge/NIH_NIBIB-R01EB030896-green.svg)](https://reporter.nih.gov/project-details/10428625)
[![NIH-NIMH-R01MH126699](https://img.shields.io/badge/NIH_NIMH-R01MH126699-green.svg)](https://reporter.nih.gov/project-details/10460628)
[![NIH-NIDCD-R01DC020088](https://img.shields.io/badge/NIH_NIDCD-R01DC020088-green.svg)](https://reporter.nih.gov/project-details/11140284)
[![NSF-BCS-1734853](https://img.shields.io/badge/NSF_BCS-1734853-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1734853)
[![NSF-BCS-2203524](https://img.shields.io/badge/NSF_BCS-2203524-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2203524)
[![NSF-IIS-1636893](https://img.shields.io/badge/NSF_IIS-1636893-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1636893)
[![NSF-OAC-2148729](https://img.shields.io/badge/NSF_OAC-2148729-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2148729)
[![NSF-IIS-1912270](https://img.shields.io/badge/NSF_IIS-1912270-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1912270)
[![NSF-IIS-2148700](https://img.shields.io/badge/NSF_IIS-2148700-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=2148700)
[![NSF-OAC-1916518](https://img.shields.io/badge/NSF_OAC-1916518-blue.svg)](https://www.nsf.gov/awardsearch/showAward?AWD_ID=1916518)

<sub>brainlife.io is publicly funded, and acknowledging that support helps keep it running. This App was developed with support from Wellcome, the U.S. National Institutes of Health (including the BRAIN Initiative BRAIN CONNECTS program: The Axonal Projectome EXchange, U24NS140384, and the Center for Mesoscale Connectomics, UM1NS132207) and the U.S. National Science Foundation.</sub>

## ⚖️ License

MIT.
