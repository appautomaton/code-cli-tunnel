# CUDA Setup

## Transformers

```bash
git clone https://github.com/huggingface/transformers.git
cd transformers

# pip
pip install '.[torch]'
```

Note: `.[torch]` installs PyTorch but not `torchvision`. If you need vision models, use:

```bash
pip install '.[torch-vision]'
```

### 8-bit loading (optional)

If you plan to use 8-bit loading with Transformers + PyTorch, install:

```bash
pip install accelerate bitsandbytes
```

## Datasets

Install datasets after transformers:

```bash
pip install datasets
```
