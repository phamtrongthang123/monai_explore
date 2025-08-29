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
    --bundle_root .
```