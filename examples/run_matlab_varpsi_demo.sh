#!/usr/bin/env bash
cd "$(dirname "$0")/../code/matlab"
matlab -nodisplay -nosplash -r "synthetic_varpsi_collapse; quit"
