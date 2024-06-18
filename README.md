# VT-Refine

VT-Refine is the official code release for the CoRL 2025 paper:

**VT-Refine: Learning Bimanual Assembly with Visuo-Tactile Feedback via Simulation Fine-Tuning**  
Binghao Huang, Jie Xu, Iretiayo Akinola, Wei Yang, Balakumar Sundaralingam, Rowland O'Flaherty, Dieter Fox, Xiaolong Wang, Arsalan Mousavian, Yu-Wei Chao†, Yunzhu Li†  
Conference on Robot Learning (CoRL), 2025  
[ [OpenReview](https://openreview.net/forum?id=bOVF8Rj33i) ] [ [arXiv](https://arxiv.org/abs/2510.14930) ] [ [video](https://youtu.be/AEt30ttJ9A8) ] [ [poster](https://docs.google.com/presentation/d/1XrH4J4JiR9n73kellCOaZleBYaGdC-xz4VoLP30GDFg) ] [ [project site](https://binghao-huang.github.io/vt_refine/) ]

### Citing VT-Refine

```BibTeX
@INPROCEEDINGS{huang:corl2025,
  author    = {Binghao Huang and Jie Xu and Iretiayo Akinola and Wei Yang and Balakumar Sundaralingam and Rowland O'Flaherty and Dieter Fox and Xiaolong Wang and Arsalan Mousavian and Yu-Wei Chao and Yunzhu Li},
  booktitle = {Conference on Robot Learning (CoRL)},
  title     = {{VT-Refine}: Learning Bimanual Assembly with Visuo-Tactile Feedback via Simulation Fine-Tuning},
  year      = {2025},
}
```

### License

VT-Refine is released under the [NVIDIA License](LICENSE).

The pre-training data are licensed under [CC BY-NC 4.0](https://creativecommons.org/licenses/by-nc/4.0/).

### Contents

1. [Installation](#installation)
2. [Pre-training](#pre-training)
3. [Evaluation - Pre-training](#evaluation---pre-training)
4. [Fine-tuning](#fine-tuning)
5. [Evaluation - Fine-tuning](#evaluation---fine-tuning)

## Installation

```Shell
git clone --recursive https://github.com/NVlabs/vt-refine.git
cd vt-refine
```

```Shell
./docker/build.sh
```

```Shell
DPPO_WANDB_ENTITY=$DPPO_WANDB_ENTITY ./docker/run.sh
```

## Pre-training

```Shell
./data/fetch_vt-refine_data.sh
```

```Shell
# Aloha - 00186
python3 dppo/script/run.py \
    --config-name=pre_tactile \
    --config-path=../cfg/aloha/pretrain/00186
```

```Shell
# SRL_Rummy - 00186
python3 dppo/script/run.py \
    --config-name=pre_tactile \
    --config-path=../cfg/srl_rummy/pretrain/00186
```

## Evaluation - Pre-training

```Shell
# Aloha - 00186
python3 dppo/script/run.py \
    --config-name=eval_pre_tactile \
    --config-path=../cfg/aloha/eval/00186 \
    base_policy_path=$PRETRAIN_POLICY_PATH
```

```Shell
# SRL_Rummy - 00186
python3 dppo/script/run.py \
    --config-name=eval_pre_tactile \
    --config-path=../cfg/srl_rummy/eval/00186 \
    base_policy_path=$PRETRAIN_POLICY_PATH
```

## Fine-tuning

```Shell
# Aloha - 00186
python3 dppo/script/run.py \
    --config-name=ft_tactile \
    --config-path=../cfg/aloha/finetune/00186 \
    base_policy_path=$PRETRAIN_POLICY_PATH
```

```Shell
# SRL_Rummy - 00186
python3 dppo/script/run.py \
    --config-name=ft_tactile \
    --config-path=../cfg/srl_rummy/finetune/00186 \
    base_policy_path=$PRETRAIN_POLICY_PATH
```

## Evaluation - Fine-tuning

```Shell
# Aloha - 00186
python3 dppo/script/run.py \
    --config-name=eval_ft_tactile \
    --config-path=../cfg/aloha/eval/00186 \
    base_policy_path=$FINETUNE_POLICY_PATH
```

```Shell
# SRL_Rummy - 00186
python3 dppo/script/run.py \
    --config-name=eval_ft_tactile \
    --config-path=../cfg/srl_rummy/eval/00186 \
    base_policy_path=$FINETUNE_POLICY_PATH
```
