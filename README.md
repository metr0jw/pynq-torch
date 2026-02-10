# pynq-torch

Pre-built PyTorch 2.10.0 wheels for Pynq-Z2 (ARMv7l) and Python 3.12.

## Install

Download a wheel from the [releases page](https://github.com/metr0jw/pynq-torch/releases) and install it:

```bash
pip install torch-2.10.0-cp312-cp312-linux_armv7l.whl
```

## Warning

Pynq-Z2 has 512MB RAM. Use at least 2GB swap to avoid out-of-memory errors.

## Build flags

- `NO_CUDA=1`
- `NO_DISTRIBUTED=1`
- ARM NEON optimization enabled
