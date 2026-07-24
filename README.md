# Beyond Chapter VII
## A quantitative analysis of how the Security Council moderates the legal value of its resolutions

Forthcoming: _Leiden Journal of International Law_

**This repository contains the complete code used for the article.
It includes all scripts required to reproduce the analyses as well as the tables and figures.**


```
Hannah Birkenkötter
Instituto Tecnológico Autónomo de México (ITAM)
hannah.birkenkotter@itam.mx

Kilian Lüders
Universität Regensburg (UR)
kilian.lueders@ur.de
```

### Abstract 
```
The Security Council is considered the only organ within the United
Nations that can issue legally binding decisions for states. With over two
thousand resolutions adopted, the UNSC has developed a practice of
formalistic legal language. However, the conditions under which
resolutions are considered binding are controversial. By empirically
examining all resolutions adopted between 1946 and 2023, we shed light
on how the Council uses various linguistic markers considered indicative
of legal bindingness. We find that the Council has developed a clear
practice of explicitly referencing Chapter VII when it intends to take
legally binding decisions and when it first establishes a peace mission.
This practice has been consistent for the past two and a half decades.
The Council lacks, however, a clearly discernible and consistent practice
where it adopts ostensibly legally binding decisions without explicit
references to Chapter VII. These results have consequences for the
debate on the legal validity of the resolutions.
```

#### Dataset on Zenodo

The project is based on the dataset **Corpus of Resolutions: UN Security Council** by Séan Fobbe, Lorenzo Gasbarri, and Niccolò Ridi:

- Séan Fobbe, Lorenzo Gasbarri, and Niccolò Ridi: **Corpus of Resolutions: UN Security Council (CR-UNSC)** Dataset. Version: 2024-05-19. Online available: https://zenodo.org/doi/10.5281/zenodo.11212056
- Séan Fobbe, Lorenzo Gasbarri, and Niccolò Ridi: **Words of Power: Introducing a Comprehensive Corpus of UN Security Council Resolutions** Draft. Online available: https://doi.org/10.5281/zenodo.15191558

---
# Documentation

## Repository layout

To keep the repository compact, only the essential raw data files are included.
Larger generated files (stored as Python pickle files) are intentionally omitted.
They can be recreated by running the code.

```
.
├── 1_data_preparation.ipynb
├── 2_create_variables.ipynb
├── 3_data_analysis.ipynb
├── 4_llm_inference.ipynb
├── 5_analyse_actor.ipynb
├── README.md
├── data
│   ├── CR-UNSC_2024-05-19_ALL_CSV_FULL.csv      # not part of the github repo
│   ├── actors_handcoded.xlsx
│   ├── actors_handcoding_check.xlsx
│   ├── data_res.pkl                             # not part of the github repo
│   ├── full_data.pkl                            # not part of the github repo
│   ├── full_data_vars.pkl                       # not part of the github repo
│   ├── handcoding.json
│   ├── phrases.csv
│   ├── subset_demand_request_decide.pkl         # not part of the github repo
│   └── subset_demand_request_decide_llm.pkl
├── figures
│   ├── data_length.csv
│   ├── data_res.csv
│   ├── fig_1_desc_length.R
│   ├── fig_1_desc_length.png
│   ├── fig_2_art25.R
│   ├── fig_2_art25.png
│   ├── fig_3_chVII.R
│   ├── fig_3_chVII.png
│   ├── fig_4_venn.R
│   ├── fig_4_venn.png
│   ├── fig_5_venn_art39_lang.R
│   ├── fig_5_venn_art39_lang.png
│   ├── uvr.lock
│   └── uvr.toml
├── pyproject.toml
├── tables
│   ├── data_res.xlsx
│   ├── tab1_art25.tex
│   ├── tab1_art25.xlsx
│   ├── tab2_decade.tex
│   ├── tab2_decade.xlsx
│   ├── tab3_decade.tex
│   └── tab3_decade.xlsx
└── uv.lock
```

## Code Base

### Step 1 – `1_data_preparation.ipynb`

This step prepares the raw data for the analysis (parsing, segmenting, and structuring the input data into a clean analysis-ready format).

### Step 2 – `2_create_variables.ipynb`

This step creates the main variables. Building on the preprocessed paragraph-level text data, it filters and transforms the data, generates the variables used in the analysis, and aggregates the information to the resolution level for further analysis and visualization. In addition, it produces the formatted tables required for the online appendix and publication.

### Step 3 – `3_data_analysis.ipynb`

This step performs the descriptive analysis.

### Step 4 – `4_llm_inference.ipynb`

This step uses ChatGPT to extract information on the actor in selected paragraphs.

### Step 5 – `5_analyse_actor.ipynb`

This step finally analyses the data annotated by the LLM.

### Step 6 - figures

The folder `figures/` contains the R scripts used to generate the figures in the paper.

---


## Setup

The project uses dependency management.
However, it uses well-established R and Python libraries.
As a result, the project should run on virtually any standard R/Python environment.

### Python

The project uses [uv](https://docs.astral.sh/uv/) for Python dependency management.

```bash
uv sync
```

### R

The project uses [uvr](https://nbafrank.github.io/uvr/) for dependency management in R.

```bash
uvr sync
```

## LLM Usage

As highlighted in the paper, this research employed a Large Language Model (LLM) to extract information from a series of text documents. Specifically, the task involved identifying which actors were addressed in selected clauses of United Nations Security Council resolutions. The extracted data were subsequently analyzed in the paper (see Section 4.3.2).

Additional LLM-based tools were used for editorial purposes, including: correcting spelling and grammar, improving language (readability and flow), and translating text segments. Tools employed for these tasks included Grammarly, DeepL, ChatGPT-4, and ChatGPT-5. ChatGPT was also used as an aid during the development, debugging, and programming process, as well as the documentation of the repository. The authors have manually reviewed any text edits suggested by LLM-based tools and bear sole responsibility for the integrity and accuracy of the final text.
