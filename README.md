# Dataprocessing

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

# Install in environment:  
| Name        | Version     |
| ----------- | ----------- |
| conda       | 24.3.0      |
| conda-forge | 24.1.2*     |
| bioconda    | Text*       |
| snakemake   | 8.10.4      |
| pbkt        | 3.1.1       |
| pbmm2       | 1.13.1      |
| trgt        | 0.8.0       |
| samtools    | Text        |
| bcftoools   | Text        |

*note : conda-forge and bioconda are optional if used by channels like this:

```shell
conda install -c conda-forge -c bioconda <package>
```









