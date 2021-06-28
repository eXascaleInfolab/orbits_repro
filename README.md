# Overview

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

The experiments of Fig 12 use datasets which are too large for github. To obtain these results, please first download the following archives:
   - https://drive.switch.ch/index.php/s/MBubEIjA4youheB 
   - https://drive.switch.ch/index.php/s/sJ7d5uunzIq3fKY

Then, open `TestingFramework/bin/Debug/data` folder and extract `bafu_full_normal.txt` into `bafu_full` subfolder and `soccer_full_normal.txt` into `soccer_full` subfolder.

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
     - Plots: Results/streaming_end/missingpercentage/\%dataset\%/error/plots/\%dataset\%\_rmse.eps

  - Figure 6: tba
     - RMSE :
     - Plots: 

  - Figure 7: 
     - RMSE: 
     - Plots: Results/streaming_end/ts-block-fix/\%dataset\%/error/plots/\%dataset\%\_rmse.eps

  - Figure 8: 
     - RMSE: 
     - Plots: Results/streaming_end/mcar-ts-multiblock/\%dataset\%/error/plots/\%dataset\%\_rmse.eps

  - Figure 9: tba
     - RMSE:
     - Plots:  

  - Figure 10: 
     - RMSE: 
     - Plots: Results/streaming_end/mcar-length/\%dataset\%/runtime/plots/\%dataset\%\_rt.eps

  - Figure 11: 
     - Runtime:  
     - Plots: Results/streaming_end/mcar-length/\%dataset\%/runtime/plots/\%dataset\%\_rt.eps

  - Figure 12: 
     - Runtime:  
     - Plots: ResultsLONG/streaming_end/mcar-length/\%dataset\%/runtime/plots/\%dataset\%\_rt.eps

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

