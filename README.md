## Workflow to annotate genomes using either bakta or prokka and generate a pangenome using panaroo.
### Usage

```

===================================================================
 GENOME ANNOTATION AND PANGENOMICS: TAPIR Pipeline version 1.0dev
===================================================================
 The typical command for running the pipeline is as follows:
       
        nextflow run main.nf --gff_input "PathToGFFfiles" --output_dir "PathToOutputDir" --panaroo

  

        Mandatory arguments:
         --assemblies                   Query genome assembly file(s) to be supplied as input (e.g., "/MIGE/01_DATA/03_ASSEMBLY/T055-8-*.fasta")
         --output_dir                   Output directory to place output reads (e.g., "/MIGE/01_DATA/04_ANNOTATION/")
	 --bakta			must be supplied to run bakta
	 --prokka			must be supplied to run prokka
	 --panaroo                      must be supplied in any case for pangenome analysis
         
        Optional arguments:
	 --bakta_db			Path to bakta database if the --bakta option is supplied
	 --gff_input                    Path to gff/gff3 file if available. In this case, the --assemblies (and --prokka or --bakta) arguments are no longer necessary.
         --help                         This usage statement.
         --version                      Version statement
```


## Introduction
This pipeline annotates genomes using bakta (using the `--bakta` option) or prokka (using the `--prokka` option), and generates a pangenome using [Panaroo](https://gtonkinhill.github.io/panaroo/#/gettingstarted/quickstart). This Nextflow pipeline was adapted from NF Core's [bakta module](https://github.com/nf-core/modules/tree/master/modules/nf-core/bakta/bakta), NF Core's [prokka module](https://github.com/nf-core/modules/tree/master/modules/nf-core/prokka), and NF Core's [panaroo module](https://github.com/nf-core/modules/blob/master/modules/nf-core/panaroo).  

Bakta databases (full or light) can be downloaded from the [bakta Github page](https://github.com/oschwengers/bakta#database-download).


## Sample command

An example command to run this pipeline if gff files are available is

```
nextflow run main.nf --gff_input "/path/to/*.gff*" --output_dir "PathToOutputDir" --panaroo
```

An example of a command to run this pipeline if a gff output is absent, using bakta is:

```
nextflow run main.nf --assemblies '*.fasta' --output_dir test3 --bakta --bakta_db /absolute/file/path/to/db --panaroo

```

and for prokka is:
```
nextflow run main.nf --assemblies '*.fasta' --output_dir 'test4' --prokka --panaroo

```

Simply remove the `--panaroo` argument if you interested in running the annotation pipeline alone.

## Word of Note
This is an ongoing project at the Microbial Genome Analysis Group, Institute for Infection Prevention and Hospital Epidemiology, Üniversitätsklinikum, Freiburg. The project is funded by BMBF, Germany, and is led by [Dr. Sandra Reuter](https://www.uniklinik-freiburg.de/iuk-en/infection-prevention-and-hospital-epidemiology/research-group-reuter.html).


## Authors and acknowledgment
The TAPIR (Track Acquisition of Pathogens In Real-time) team.
