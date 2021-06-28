# Overview

<img img align="right" width="50" height="50" src="orbits_logo.png" >

- **Algorithms**: The benchmark evaluates all the algorithms mentioned in the paper: ORBITS, SPIRIT, GROUSE, OGDImpute, pcaMME, TKCM and M-RNN<sup>*</sup>. To enable/disable any algorithm, please refer to the *Algorithms customization* section below.
- **Datasets**: The benchmark evaluates all the datasets used in the paper: gas (drfit10), motion, bafu and soccer<sup>*</sup>. 
- **Scenarios**: The benchmark will execute the full set of 11 recovery scenarios and report the recovery error (RMSE, MSE and MAE) and correlation (Pearson and Spermann). 
A detailed description of the recovery scenarios can be found [here](https://github.com/eXascaleInfolab/orbits/blob/master/TestingFramework/README.md).

<sup>*</sup>disabled by default as it takes a couple of days to run.
<!--
The online scenarios are described [here](https://github.com/eXascaleInfolab/orbits/blob/master/TestingFramework/bin/Debug/results/plotfiles/streaming_end.txt) while the batch scenarios are described [here](https://github.com/eXascaleInfolab/orbits/blob/master/TestingFramework/bin/Debug/results/plotfiles/batch_mid.txt). 
-->

[**Prerequisites**](#prerequisites) | [**Build**](#build) | [**Execution**](#execution) | [**Citation**](#citation)
___ 
 
## Prerequisites

- Ubuntu 16 or 18 (including Ubuntu derivatives, e.g., Xubuntu).
- Clone this repository.
- Mono: Install mono from https://www.mono-project.com/download/stable/ (takes few minutes)

___
## Build

- Build the Testing Framework using the installation script located in the root folder (takes few minutes):
```bash
    $ sh install_linux.sh
```

Some experiments use data sets too large for github. Please download the following archives:
   - https://drive.switch.ch/index.php/s/MBubEIjA4youheB 
   - https://drive.switch.ch/index.php/s/sJ7d5uunzIq3fKY

Open `TestingFramework/bin/Debug/data` folder and exctract `bafu_full_normal.txt` into `bafu_full` subfolder and `soccer_full_normal.txt` into `soccer_full` subfolder.

___
## Execution

```bash
    $ cd TestingFramework/bin/Debug/
```

We have two versions of reproducibilty: simplied (fast but lacks some results) and full (slow and complete). 
To run the simplified set of tests (results of M-RNN (all datasets) and SSV/SSVi (Soccer dataset) will be missing:

```bash
    $ sh repro_short.sh
```

To run the full version (might take more than a week):

```bash
    $ sh repro_long.sh
```

___
## Results
The results of each experiment will be added to one of these folders: `Results`, `ResultsLONG` and `ResultsORBITS`.

  - Figure 5: Results/streaming_end/missingpercentage/\%dataset\%/error/plots/\%dataset\%\_rmse.eps

  - Figure 6: tba

  - Figure 7: Results/streaming_end/ts-block-fix/\%dataset\%/error/plots/\%dataset\%\_rmse.eps

  - Figure 8: Results/streaming_end/mcar-ts-multiblock/\%dataset\%/error/plots/\%dataset\%\_rmse.eps

  - Figure 9: tba

  - Figure 10: Results/streaming_end/mcar-length/\%dataset\%/runtime/plots/\%dataset\%\_rt.eps

  - Figure 11: Results/streaming_end/mcar-length/\%dataset\%/runtime/plots/\%dataset\%\_rt.eps

  - Figure 12: ResultsLONG/streaming_end/mcar-length/\%dataset\%/runtime/plots/\%dataset\%\_rt.eps

  - Figure 13a: ResultsORBITS/f13_len.txt

  - Figure 13b: ResultsORBITS/f13_col.txt


___
## Citation
```bibtex
@inproceedings{orbits2021vldb,
 author    = {Mourad Khayati and Ines Arous and Zakhar Tymchenko and Philippe Cudr{\'{e}}{-}Mauroux},
 title     = {ORBITS: Online Recovery of Missing Values in Multiple Time Series Streams},
 booktitle = {Proceedings of the VLDB Endowment},
 volume    = {14},
 number    = {3},
 year      = {2021}
}
```

