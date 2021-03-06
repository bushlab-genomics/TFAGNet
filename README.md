# TFAGNet
This page contains description of the TFAGNet container(https://hub.docker.com/repository/docker/bushlab/tfagnet). Here, I have explained how to use this container to score genetic variants based on their ability to affect transcription factor(TF) binding affinity. 

# Required installation
You can use either **Docker** (https://docs.docker.com/get-docker/) or **Singularity** (https://github.com/sylabs/singularity/releases) to run the container. 

# Downloading the container
You can use the following commands to pull the container using docker or singularity. Note: container size is fairly big (~40GB), so please clear out some storage space before downloading the container.

```
docker pull bushlab/tfagnet:latest
```

```
singularity pull docker://bushlab/tfagnet:latest
```

# Running the container
The shell scripts **run_tfagnet.sh** and **run_tfagnet_custom_tfbs.sh** can be used to score the variants. **run_tfagnet.sh** uses a pre-defined set of TFBS for GM12878 used in the original paper, while the **run_tfagnet_custom_tfbs.sh** needs user-defined TFBS file. This file can be generated using the code provided in https://github.com/bushlab-genomics/TF_GRN.

```
. run_tfagnet.sh $1 [ container type: docker/singularity] $2[variants file in vcf format] $3 [genome reference build(37/38)] $4 [output prefix for the folder containing the results]

. run_tfagnet_custom_tfbs.sh $1 [ container type: docker/singularity] $2 [variants file in vcf format] $3 [csv file containing cis-regulatory TF binding sites(TFBS) for each gene] $4 [genome reference build(37/38)] $5 [output prefix for the folder containing the results]

```
The $output_prefix_results folder contains two results files: 
1) $output_prefix_variants_tfbs_merged.csv: This file contains the merged TFBS with the variant information within each gene's cis-regulatory region.
2) $output_prefix_variant_tfbs_scores_postprocessed_$reference_build.csv: This file contains the TF-AGNet scores for the cis-regulatory TFBS for each variant for each gene. The scores are provided in two columns: "diff" containing difference between TF-AGNet scores of the reference and the alternate allele for a variant."Log_score" containing the log10 scaled scores. 

# Example run

The following scripts will execute the container in docker environment

```
. run_tfagnet.sh docker toy_variants.vcf 37 toy

. run_tfagnet_custom_tfbs.sh docker toy_variants.vcf toy_gene_tfbs.csv 37 toy

```
The following scripts will execute the container in singularity environment

```
. run_tfagnet.sh singularity toy_variants.vcf 37 toy

. run_tfagnet_custom_tfbs.sh singularity toy_variants.vcf toy_gene_tfbs.csv 37 toy

```

# Citation
Please cite our bioRxiv preprint(https://www.biorxiv.org/content/10.1101/2021.07.30.454350v1) if you use the models.
