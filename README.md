## Environment (slur)
```bash
uv init 
uv add torch torchvision huggingface-hub pillow matplotlib numpy monai fire
```

if you clone this repo, you can simply 
```
uv sync
```

## MONAI Bundle with mednist GAN 
Download checkpoint and configs:
```
uv run python -m monai.bundle download --name "mednist_gan" --bundle_dir ./bundles
```

```bash
cd ./bundles/mednist_gan
uv run python -m monai.bundle run inferring \
    --meta_file configs/metadata.json \
    --config_file configs/inference.json \
    --logging_file configs/logging.conf \
    --bundle_root . \
    --num_samples 100000
```

## MAISI
```
uv run python -m monai.bundle download --name "maisi_ct_generative" --bundle_dir ./bundles
```

one sample with 512 512 128 spacing 0.8 0.8 2.5 is 31mb. So we cant generate much. 
```bash
cd ./bundles/maisi_ct_generative
uv run python -m monai.bundle run --config_file configs/inference.json --num_output_samples 3000
```

càng specify nhiều vô "anatomy_list": [], thì càng ít mask candidate. Đại loại là dựa vào mask candidate để nó gen ra ảnh. Nên là buộc phải có số lượng mask nhỏ hơn số sample. 
nên max number là khi list đó empty. 

## Chest X-ray Latent Diffusion Synthesis

```
uv run python -m monai.bundle download --name "cxr_image_synthesis_latent_diffusion_model" --bundle_dir ./bundles
```

```bash
cd ./bundles/cxr_image_synthesis_latent_diffusion_model
uv run python -m monai.bundle run --config_file configs/inference.json --prompt "Small right-sided pleural effusion" --guidance_scale 7.0
```

inference json có thể đổi filename format đơn giản từ ở "out_file"
Từ `"$datetime.now().strftime('sample_%H%M%S_%d%m%Y')"`, sang `"$datetime.now().strftime('sample_%H%M%S_%d%m%Y') + '__'+ @prompt"`, để dễ sort output images. 