#!/bin/bash
set -e

TEST_IDENTIFIER=$1
CONFIG_PATH=$2
PAUSE_EL_COUNT=$3

# Start the kurtosis testnet
kurtosis module exec --enclave-id eth2 \
    kurtosistech/eth2-merge-kurtosis-module:ext-miner-tests \
    --execute-params "$(cat ${CONFIG_PATH})"

# Get the external miner container id
EXTERNAL_MINER_CONTAINER=$(docker ps | grep external_miner | awk '{print $1}')

# Get the geth containers
GETH_CONTAINERS=$(docker ps | grep geth | awk '{print $1}' | head -n $PAUSE_EL_COUNT)

# Grep the external miner output until the keyword is found
echo "Waiting for the external miner to find the TTD block."
while ! docker logs $EXTERNAL_MINER_CONTAINER | grep -q "Delaying block"; do
    sleep 1
done
echo "External miner has found the TTD block. Execution clients will be paused now."

# Pause the containers
for CONTAINER in $GETH_CONTAINERS; do
    docker pause $CONTAINER
done

# Sleep for 2 minutes
echo "Sleeping for 2 minutes with Execution clients paused"
sleep 120

# Unpause the containers
for CONTAINER in $GETH_CONTAINERS; do
    docker unpause $CONTAINER
done

# Sleep for 4 epochs before stoping the testnet
echo "Sleeping for 4 epochs"
sleep 1536

# Stop the testnet prober
PROBER_CONTAINER=$(docker ps | grep merge-testnet-prober | awk '{print $1}')
docker stop $PROBER_CONTAINER

# Stop the kurtosis module
kurtosis enclave stop eth2

# Dump and save the results
kurtosis enclave dump eth2 ./dumps/$TEST_IDENTIFIER

# Remove the kurtosis module
kurtosis enclave rm eth2
