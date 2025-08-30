#!/bin/bash
#SBATCH -N 1
#SBATCH -p agpu
#SBATCH --nodelist=c2008
#SBATCH -t 3-00:00:00
#SBATCH -J "monai"
#SBATCH -o slurm/monai_%j.out
#SBATCH -e slurm/monai_%j.err

cd /home/tp030/monai_explore/bundles/mednist_gan
zip -r mednist_gan_inference.zip outputs/