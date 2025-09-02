from huggingface_hub import HfApi
api = HfApi()
api.upload_file(
    path_or_fileobj="bundles/cxr_image_synthesis_latent_diffusion_model/cxr_generated.zip",
    path_in_repo="cxr_generated.zip",
    repo_id="phamtrongthang/monai_explore",
    repo_type="dataset",
)
api.upload_file(
    path_or_fileobj="bundles/mednist_gan/mednist_gan_inference.zip",
    path_in_repo="mednist_gan_inference.zip",
    repo_id="phamtrongthang/monai_explore",
    repo_type="dataset",
)
api.upload_file(
    path_or_fileobj="bundles/maisi_ct_generative/maisi_ct_generated.zip",
    path_in_repo="maisi_ct_generated.zip",
    repo_id="phamtrongthang/monai_explore",
    repo_type="dataset",
)
