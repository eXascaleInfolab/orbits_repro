# Reproducibility Repo for ORBITS Results

<img img align="right" width="50" height="50" src="orbits_logo.png" >

- **Algorithms**: The benchmark evaluates all the algorithms mentioned in the paper: ORBITS, SPIRIT, GROUSE, OGDImpute, pcaMME, TKCM and M-RNN<sup>*</sup>. 
- **Datasets**: The benchmark evaluates all the datasets used in the paper: gas (drfit10), motion, bafu and soccer. 
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

The experiments of Fig 12 use datasets which are too large for github. To obtain those results:
1. Download the following zip files:
   - https://drive.switch.ch/index.php/s/MBubEIjA4youheB 
   - https://drive.switch.ch/index.php/s/sJ7d5uunzIq3fKY

2. Extract `bafu_full_normal.txt` and `soccer_full_normal.txt` into `TestingFramework/bin/Debug/data/bafu_full/` and `TestingFramework/bin/Debug/data/soccer_full/`, respectively.

___
## Execution

We have two versions of reproducibilty: simplied (fast but lacks some results) and full (slow and complete). 
- To run the simplified set of tests (takes ~1.5 days). The results of M-RNN (all datasets) and SSV/SSVi (Soccer dataset) will be missing:

```bash
    $ cd TestingFramework/bin/Debug/
    $ sh repro_short.sh
```

- To run the full version (takes ~1 week):

```bash
 $ cd TestingFramework/bin/Debug/
 $ sh repro_long.sh
```

___
## Results

### Figure 5 
  - Fig. 5a: 
     -  Plot: Results/streaming_end/missingpercentage/drift10/error/plots/drift10\_rmse.eps
     -  RMSE: Results/streaming_end/missingpercentage/drift10/error/rmse
  - Fig. 5b: 
     - Plot: Results/streaming_end/missingpercentage/motion/error/plots/motion\_rmse.eps
     - RMSE: Results/streaming_end/missingpercentage/motion/error/rmse
  - Fig 5c: 
     - Plot: Results/streaming_end/missingpercentage/bafu/error/plots/bafu\_rmse.eps
     - RMSE:  Results/streaming_end/missingpercentage/bafu/error/rmse
  - Fig 5c: 
     - Plot: Results/streaming_end/missingpercentage/soccer/error/plots/soccer\_rmse.eps
     - RMSE: Results/streaming_end/missingpercentage/soccer/error/rmse

### Figure 6
Manual aggregation over mutiple results. The reproducibility of this figure is hard to automate
  
### Figure 7
  - Fig 7a:
     - Plot: Results/streaming_end/ts-block-fix/drift10/error/plots/drift10\_rmse.eps
     - RMSE: Results/streaming_end/ts-block-fix/drift10/error/rmse
  - Fig 7b:
     - Plot: Results/streaming_end/ts-block-fix/motion/error/plots/motion\_rmse.eps
     - RMSE: Results/streaming_end/ts-block-fix/motion/error/rmse
  - Fig 7c:
     - Plot: Results/streaming_end/ts-block-fix/bafu/error/plots/bafu\_rmse.eps
     - RMSE: Results/streaming_end/ts-block-fix/bafu/error/rmse
  - Fig 7d:
     - Plot: Results/streaming_end/ts-block-fix/soccer/error/plots/soccer\_rmse.eps
     - RMSE: Results/streaming_end/ts-block-fix/soccer/error/rmse


### Figure 8
  - Fig 8a:
     - Plot: Results/streaming_end/mcar-ts-multiblock/drift10/error/plots/drift10\_rmse.eps
     - RMSE: Results/streaming_end/mcar-ts-multiblock/drift10/error/rmse
  - Fig 8b:
    - Plot: Results/streaming_end/mcar-ts-multiblock/motion/error/plots/motion\_rmse.eps
    - RMSE: Results/streaming_end/mcar-ts-multiblock/motion/error/rmse
  - Fig 8c:
    - Plot: Results/streaming_end/mcar-ts-multiblock/bafu/error/plots/bafu\_rmse.eps
    - RMSE: Results/streaming_end/mcar-ts-multiblock/bafu/error/rmse
  - Fig 8d:
   - Plot: Results/streaming_end/mcar-ts-multiblock/soccer/error/plots/soccer\_rmse.eps
   - RMSE: Results/streaming_end/mcar-ts-multiblock/soccer/error/rmse
### Fig 9
tbd


### Figure 10
  - Fig 10a:
     -  Plot: Results/streaming_end/mcar-length/bafu/runtime/plots/bafu\_rt\_log.eps
     -  Runtime: Results/streaming_end/mcar-length/bafu/runtime/values
  - Plot 10b: 
     -  Plot: Results/streaming_end/mcar-length/socccer/runtime/plots/socccer\_rt\_log.eps
     -  Runtime:Results/streaming_end/mcar-length/socccer/runtime/values

### Figure 11: 
  - Fig 11a:
     -  Plot: Results/streaming_end/mcar-columns/motion/runtime/plots/drift10\_rt\_log.eps
     -  Runtime: Results/streaming_end/mcar-columns/motion/runtime/values
  - Fig 11b:
     -  Plot: Results/streaming_end/mcar-columns/motion/runtime/plots/drift10\_rt\_log.eps
     -  Runtime: Results/streaming_end/mcar-columns/motion/runtime/values

### Figure 12
  - Fig 12a:
    -  Plot: ResultsLONG/streaming_end/mcar-length/bafu_full/runtime/plots/bafu_full\_rt\_log.eps
    -  Runtime: ResultsLONG/streaming_end/mcar-length/bafu_full/runtime/values
  - Fig 12b:
    -  Plot: ResultsLONG/streaming_end/mcar-length/soccer_full/runtime/plots/soccer_full\_rt\_log.eps
    -  Runtime: ResultsLONG/streaming_end/mcar-length/bafu_full/runtime/values

### Figure 13
  - Fig 13a: 
     - Runtime: ResultsORBITS/f13_len.txt

  - Figure 13b: 
     - Runtime: ResultsORBITS/f13_col.txt


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

