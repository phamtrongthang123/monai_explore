#!/bin/bash
#SBATCH -N 1
#SBATCH -p agpu
#SBATCH --nodelist=c1912
#SBATCH -t 3-00:00:00
#SBATCH -J "cxr_image_synthesis_latent_diffusion_model"
#SBATCH -o slurm/cxr_image_synthesis_latent_diffusion_model_%j.out
#SBATCH -e slurm/cxr_image_synthesis_latent_diffusion_model_%j.err

cd /home/tp030/monai_explore/bundles/cxr_image_synthesis_latent_diffusion_model

# Array of MONAI bundle commands with different prompts. I dont know what prompt exactly will work so I use the normal prompt.
commands=(
    "python -m monai.bundle run --config_file configs/inference.json --prompt \"Big right-sided pleural effusion\" --guidance_scale 7.0"
    "python -m monai.bundle run --config_file configs/inference.json --prompt \"Small right-sided pleural effusion\" --guidance_scale 7.0"
    "python -m monai.bundle run --config_file configs/inference.json --prompt \"Bilateral pleural effusion\" --guidance_scale 7.0"
    "python -m monai.bundle run --config_file configs/inference.json --prompt \"Cardiomegaly\" --guidance_scale 7.0"
)

# Number of iterations
max_iterations=1000000

echo "Starting MONAI bundle random execution loop for $max_iterations iterations..."
echo "Press Ctrl+C to stop the loop early"
echo ""

# Loop 1 million times
for ((i=1; i<=max_iterations; i++)); do
    # Generate random index (0-3) to select command
    random_index=$((RANDOM % ${#commands[@]}))
    
    # Get the selected command
    selected_command="${commands[$random_index]}"
    
    echo "Iteration $i/$max_iterations - Executing command $((random_index + 1)):"
    echo "$selected_command"
    echo ""
    
    # Execute the selected command
    eval "uv run $selected_command"
    
    # Check if command failed and optionally break or continue
    if [ $? -ne 0 ]; then
        echo "Warning: Command failed at iteration $i"
        echo "Continue? (y/n) [default: y]"
        read -t 5 -n 1 response
        echo ""
        if [[ "$response" == "n" || "$response" == "N" ]]; then
            echo "Stopping execution at iteration $i"
            break
        fi
    fi
done

echo "Loop completed or terminated at iteration $i"