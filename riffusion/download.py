import torch
from riffusion_pipeline import RiffusionPipeline
def download_model():
    model = RiffusionPipeline.from_pretrained(
        "riffusion/riffusion-model-v1",
        revision="main",
        torch_dtype=torch.float16,
        # Disable the NSFW filter, causes incorrect false positives
        safety_checker=lambda images, **kwargs: (images, False),
    )

if __name__ == "__main__":
    download_model()