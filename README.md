# Dataprocessing

## Overview
This pipeline was crated for a school project using snakemake and anaconda. It creates an image to showcase extended repeats to recreate the results from this research paper:  
https://www.nature.com/articles/s41587-023-02057-3

## Usage:  
To run the pipeline, first activate the right environment:
```shell
conda activate <env>
```
Secondly make sure every package is installed as per the install section.

Then at last, start the pipeline by calling the main snakefile like this:
```shell
snakemake --cores <cores>
```

## Install 
| Name        | Version     |
| ----------- | ----------- |
| conda       | 24.3.0      |
| conda-forge | 24.1.2*     |
| bioconda    |     *       |
| snakemake   | 8.10.4      |
| pbkt        | 3.1.1       |
| pbmm2       | 1.13.1      |
| trgt        | 0.8.0       |
| samtools    | 1.19.2      |
| bcftools    | 1.19.1      |

*note : conda-forge and bioconda are optional if used by channels like this:

```shell
conda install -c conda-forge -c bioconda <package>
```

## Config
It is possible to alter the settings of the pipeline tools by using the "config.yaml" file.
You can change the directory for the data and results in their respective variable called data-, and results- directory.
To configure another reference genome, repeats and barcode file. please use the corresponding variable within the config file.
Lastly use the repeat_id to change the repeat you want visualised in the resulting images.

## Dag.png
![image](https://github.com/JoshuaTolhuis/Dataprocessing/assets/90695997/063ae4f3-1b16-4bdb-b3c3-297107937337)
