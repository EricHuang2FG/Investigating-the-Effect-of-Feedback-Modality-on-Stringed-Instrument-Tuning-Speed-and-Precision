# Investigating the Effect of Feedback Type on String Instrument Tuning Performance

## Introduction

This repository contains the R source code used to statistically analyze the effect of feedback modalities on ukulele tuning speed and accuracy. It also contains the outputted figures as well as the raw data collected to perform the analysis.

## R Source Code

All R source code is stored within the `src` folder.

### `descriptive.R`

This file produces the box plots for tuning time and tuning error, and computes the mean, median, and standard deviation of visual feedback tuning error data, visual feedback tuning time data, auditory feedback tuning error data, auditory tuning time data, as well as for the number of years of musical experience for each feedback modality.

### `inferential.R`

This file produces the inferential statistics used for analysis. This includes Quantile-Quantile plots for normality checks, Welch's independent t-test for tuning time and error between feedback modalities, Mann-Whitney U test, power test, the computation of Type II error, and the ANCOVA test.

### `correlation.R`

This file plots scatter plots that investigate how the covariate, which is the number of years of musical experience, may moderate the dependent variables. It also computes the Spearman correlation between the years of musical experience for each feedback modality and each dependent variable.

## Output Figures

All figures outputted by the source code are stored within the `figures` folder.

## Raw Data

The raw data used for this experiment is given within the `data` folder. Note that for privacy purposes, the names of participants are masked.
