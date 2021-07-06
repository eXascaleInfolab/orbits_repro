# Reproducibility Repo for ORBITS Results

<img img align="right" width="50" height="50" src="orbits_logo.png" >

- **Algorithms**: The benchmark evaluates all the algorithms mentioned in the paper: ORBITS, SPIRIT, GROUSE, OGDImpute, pcaMME, TKCM and M-RNN. 
- **Datasets**: The benchmark evaluates all the datasets used in the paper: gas (drfit10), motion, bafu and soccer. 
- **Scenarios**: The benchmark will execute the full set of 11 recovery scenarios and report the recovery error (RMSE, MSE and MAE) and correlation (Pearson and Spearman). 
A detailed description of the recovery scenarios can be found [here](https://github.com/eXascaleInfolab/orbits/blob/master/TestingFramework/README.md).

<!--
<sup>*</sup>disabled by default as it takes a couple of days to run.
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

<!--
- Download the full Soccer data for Fig 12  

```bash
   wget --load-cookies /tmp/cookies.txt "https://docs.google.com/uc?export=download&confirm=$(wget --quiet --save-cookies /tmp/cookies.txt --keep-session-cookies --no-check-certificate 'https://docs.google.com/uc?export=download&id=1MlX_3OF3zKLKocFKVWYK5yBOfXHTaDBW' -O- | sed -rn 's/.*confirm=([0-9A-Za-z_]+).*/\1\n/p')&id=1MlX_3OF3zKLKocFKVWYK5yBOfXHTaDBW" -O soccer_full_normal.txt && rm -rf /tmp/cookies.txt
```


1. Download the following zip file from  https://drive.switch.ch/index.php/s/sJ7d5uunzIq3fKY
2. Extract `soccer_full_normal.txt` into `TestingFramework/bin/Debug/data/soccer_full/`.
-->

___
## Execution

We have three reproducibilty scripts. Each script can be ran seperately.

1. Fast: reproduce the results of all figures except the ones from items 2 and 3 (takes ~2 days) 
```bash
    $ cd TestingFramework/bin/Debug/
    $ sh repro_short.sh
```

2. SSV/iSSV: reproduce the results of Figure 13 a and b -- Soccer dataset (takes ~XXX days)

```bash
 $ cd TestingFramework/bin/Debug/
 $ sh repro_extra_ssv.sh
```

3. M-RNN: reproduce the results of MRNN in all corresponding figures (takes ~ XXX days) 

```bash
    $ cd TestingFramework/bin/Debug/
    $ sh repro_extra_mrnn.sh
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
We compute the AVG for each technique over three runs. The absolute correlation values might be
slightly different as, in each run, we randomly pick a different time series to recover. 
 - Fig 9a:
    - Correlation: Results/streaming_end/mcar-ts-multiblock/drift10/error/correlation.dat
 - Fig 9b:
    - Correlation: Results/streaming_end/mcar-ts-multiblock/motion/error/correlation.dat
 - Fig 9c:
    - Correlation: Results/streaming_end/mcar-ts-multiblock/bafu/error/correlation.dat
 - Fig 9d:
    - Correlation: Results/streaming_end/mcar-ts-multiblock/soccer/error/correlation.dat


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
    -  Plot: ResultsSynth/streaming_end/mcar-length/bafu_full/runtime/plots/bafu_full\_rt\_log.eps
    -  Runtime: ResultsSynth/streaming_end/mcar-length/bafu_full/runtime/values
  - Fig 12b:
    -  Plot: ResultsSynth/streaming_end/mcar-length/soccer_full/runtime/plots/soccer_full\_rt\_log.eps
    -  Runtime: ResultsSynth/streaming_end/mcar-length/bafu_full/runtime/values

### Figure 13
  - Fig 13a: 
     - Runtime: ResultsSVector/f13_len.txt

  - Figure 13b: 
     - Runtime: ResultsSVector/f13_col.txt


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

