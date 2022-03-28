#!/bin/bash

./run-el-pause-testcase.sh teku_lighthouse_prysm_3validators_pause_1_el ./configs/teku_lighthouse_prysm_3validators.json 1
./run-el-pause-testcase.sh teku_lighthouse_prysm_3validators_pause_2_el ./configs/teku_lighthouse_prysm_3validators.json 2

./run-el-pause-testcase.sh prysm_teku_lighthouse_3validators_pause_1_el ./configs/prysm_teku_lighthouse_3validators.json 1
./run-el-pause-testcase.sh prysm_teku_lighthouse_3validators_pause_2_el ./configs/prysm_teku_lighthouse_3validators.json 2

./run-el-pause-testcase.sh lighthouse_prysm_teku_3validators_pause_1_el ./configs/lighthouse_prysm_teku_3validators.json 1
./run-el-pause-testcase.sh lighthouse_prysm_teku_3validators_pause_2_el ./configs/lighthouse_prysm_teku_3validators.json 2

./run-el-pause-testcase.sh lighthouse_lodestar_nimbus_3validators_pause_1_el ./configs/lighthouse_lodestar_nimbus_3validators.json 1
./run-el-pause-testcase.sh lighthouse_lodestar_nimbus_3validators_pause_2_el ./configs/lighthouse_lodestar_nimbus_3validators.json 2

./run-el-pause-testcase.sh lodestar_nimbus_lighthouse_3validators_pause_1_el ./configs/lodestar_nimbus_lighthouse_3validators.json 1
./run-el-pause-testcase.sh lodestar_nimbus_lighthouse_3validators_pause_2_el ./configs/lodestar_nimbus_lighthouse_3validators.json 2

./run-el-pause-testcase.sh nimbus_lighthouse_lodestar_3validators_pause_1_el ./configs/nimbus_lighthouse_lodestar_3validators.json 1
./run-el-pause-testcase.sh nimbus_lighthouse_lodestar_3validators_pause_2_el ./configs/nimbus_lighthouse_lodestar_3validators.json 2
