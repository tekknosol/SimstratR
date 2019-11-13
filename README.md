SimstratR
====


R package for basic [Simstrat](https://github.com/Eawag-AppliedSystemAnalysis/Simstrat) model running. `SimstratR` holds the version downloaded from the [website](https://github.com/Eawag-AppliedSystemAnalysis/Simstrat/releases) on 2019-11-13 and should run virtually on any Windows system.  This package does not contain the source code for the model, only the executable. This package was inspired by [GLMr](https://github.com/GLEON/GLMr).

## Installation

You can install SimstratR from Github with:

```{r gh-installation, eval = FALSE}
# install.packages("devtools")
devtools::install_github("aemon-j/SimstratR")
```
## Usage
Currently only compatible with Windows. OS and Linux coming soon...

### Run

```{r example, eval=FALSE}
library(SimstratR)
sim_folder <- system.file('extdata', package = 'SimstratR')
run_simstrat(sim_folder)
```

### Output
Suite of tools for working with Simstrat output coming soon...
