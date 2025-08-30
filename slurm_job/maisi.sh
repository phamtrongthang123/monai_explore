#!/bin/bash
#SBATCH -N 1
#SBATCH -p agpu
#SBATCH --nodelist=c2008
#SBATCH -t 3-00:00:00
#SBATCH -J "maisi"
#SBATCH -o slurm/maisi_%j.out
#SBATCH -e slurm/maisi_%j.err

cd /home/tp030/monai_explore/bundles/maisi_ct_generative
uv run python -m monai.bundle run --config_file configs/inference.json --num_output_samples 2000