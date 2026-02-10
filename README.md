# pynq-torch

Automated PyTorch wheel builds for Pynq-Z2 (ARMv7l) architectures.
Builds are triggered by git tags and are available in the [Releases](https://github.com/metr0jw/pynq-torch/releases) page.

## Supported Versions

When a tag (e.g., `v2.10.0`) is pushed, wheels are automatically built for:
- **Python 3.10**
- **Python 3.11**
- **Python 3.12**

## Installation

Download the wheel for your Python version from the [latest release](https://github.com/metr0jw/pynq-torch/releases) and install it:

```bash
# Example for Python 3.12
pip install torch-X.Y.Z-cp312-cp312-linux_armv7l.whl
```

## Warning

Pynq-Z2 has 512MB RAM. **You MUST use at least 2GB swap space** to avoid out-of-memory errors during usage.

## Build Configuration

- **Platform:** linux/arm/v7
- **Base Image:** python:slim-bookworm
- **Optimizations:** NEON, VFPv4 (Hard Float)
- **Flags:**
    - `NO_CUDA=1`
    - `NO_DISTRIBUTED=1`
    - `USE_QNNPACK=1`
    - `Use_PYTORCH_QNNPACK=1`

To manually build locally:
```bash
docker build --platform linux/arm/v7 -t pynq-torch-builder .
```
