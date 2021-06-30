# Reproducibility Repo for ORBITS Results

<img img align="right" width="50" height="50" src="orbits_logo.png" >

- **Algorithms**: The benchmark evaluates all the algorithms mentioned in the paper: ORBITS, SPIRIT, GROUSE, OGDImpute, pcaMME, TKCM and M-RNN. 
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

The experiments of Fig 12 use datasets which are too large for github. To obtain those results:
1. Download the following zip files:
   - https://drive.switch.ch/index.php/s/MBubEIjA4youheB 
   - https://drive.switch.ch/index.php/s/sJ7d5uunzIq3fKY

2. Extract `bafu_full_normal.txt` and `soccer_full_normal.txt` into `TestingFramework/bin/Debug/data/bafu_full/` and `TestingFramework/bin/Debug/data/soccer_full/`, respectively.

___
## Execution

We have two versions of reproducibilty: simplied (fast but lacks some results) and full (slow and complete). 
- To run the simplified set of tests (takes ~XXX days). The results of M-RNN (all datasets) and SSV/SSVi (Soccer dataset) will be missing:

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
The results of each experiment will be added to one of these folders: `Results`, `ResultsLONG` or `ResultsORBITS`. For each path,  please replace `%dataset%` by the name of each dataset (drift10, motion, bafu or soccer). 

  - Figure 5: 
     - RMSE: 
     - Plot 5a: Results/streaming_end/missingpercentage/drift10/error/plots/drift10\_rmse.eps
     - Plot 5b: Results/streaming_end/missingpercentage/motion/error/plots/motion\_rmse.eps
     - Plot 5c: Results/streaming_end/missingpercentage/bafu/error/plots/bafu\_rmse.eps
     - Plot 5d: Results/streaming_end/missingpercentage/soccer/error/plots/soccer\_rmse.eps

  - Figure 6: skip
     - RMSE :
     - Plots: 

  - Figure 7: 
     - RMSE: 
     - Plot 7a: Results/streaming_end/ts-block-fix/drift10/error/plots/drift10\_rmse.eps
     - Plot 7b: Results/streaming_end/ts-block-fix/motion/error/plots/motion\_rmse.eps
     - Plot 7c: Results/streaming_end/ts-block-fix/bafu/error/plots/bafu\_rmse.eps
     - Plot 7d: Results/streaming_end/ts-block-fix/soccer/error/plots/soccer\_rmse.eps

  - Figure 8: 
     - RMSE: 
     - Plot 8a: Results/streaming_end/mcar-ts-multiblock/drift10/error/plots/drift10\_rmse.eps
     - Plot 8b: Results/streaming_end/mcar-ts-multiblock/motion/error/plots/motion\_rmse.eps
     - Plot 8c: Results/streaming_end/mcar-ts-multiblock/bafu/error/plots/bafu\_rmse.eps
     - Plot 8d: Results/streaming_end/mcar-ts-multiblock/soccer/error/plots/soccer\_rmse.eps

  - Figure 9: tba
     - RMSE:
     - Plots:  

  - Figure 10: 
     - Runtime: 
     - Plot 10a: Results/streaming_end/mcar-length/bafu/runtime/plots/bafu\_rt.eps
     - Plot 10b: Results/streaming_end/mcar-length/socccer/runtime/plots/socccer\_rt.eps

  - Figure 11: 
     - Runtime:  
     - Plot 11a: Results/streaming_end/mcar-columns/motion/runtime/plots/drift10\_rt.eps
     - Plot 11b: Results/streaming_end/mcar-columns/motion/runtime/plots/drift10\_rt.eps

  - Figure 12: 
     - Runtime:  
     - Plot 12a: ResultsLONG/streaming_end/mcar-length/bafu_full/runtime/plots/bafu_full\_rt.eps
     - Plot 12b: ResultsLONG/streaming_end/mcar-length/soccer_full/runtime/plots/soccer_full\_rt.eps

  - Figure 13a: 
     - RMSE: ResultsORBITS/f13_len.txt
     - Plots:

  - Figure 13b: 
     - RMSE: ResultsORBITS/f13_col.txt
     - Plots:


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

