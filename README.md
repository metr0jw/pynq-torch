# pynq-torch

Pre-built PyTorch 2.2.0 wheels for Pynq-Z2 (ARMv7l) and Python 3.12.

## Installation

```bash
pip install torch-2.2.0-cp312-cp312-linux_armv7l.whl
```

## ⚠️ RAM Limitation Warning

The Pynq-Z2 board has only 512MB of RAM. **It is strongly recommended to set up at least 2GB of swap space** before installing or using PyTorch to avoid out-of-memory errors.

## Build Configuration

This wheel was built with the following flags:

- `NO_CUDA=1` - CUDA support disabled
- `NO_DISTRIBUTED=1` - Distributed training disabled
- ARM NEON optimization enabled
