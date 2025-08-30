#!/bin/bash
#SBATCH -N 1
#SBATCH -p agpu
#SBATCH --nodelist=c1912
#SBATCH --exclusive
#SBATCH -t 3-00:00:00
#SBATCH -J "monai"
#SBATCH -o slurm/monai_%j.out
#SBATCH -e slurm/monai_%j.err

cd /home/tp030/monai_explore/bundles/mednist_gan
uv run python -m monai.bundle run inferring \
    --meta_file configs/metadata.json \
    --config_file configs/inference.json \
    --logging_file configs/logging.conf \
    --bundle_root . \
    --num_samples 1000000