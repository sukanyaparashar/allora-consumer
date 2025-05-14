# Allora Labs Consumer Contract

This directory contains the Allora Labs consumer contract in Solidity that can be deployed to any EVM chain. It also consists of some example scripts to verify the functions of the smart contract.

## Cloning repository

Run command

```sh
git clone https://github.com/sukanyaparashar/allora-consumer.git
cd allora-consumer
```

## Install the required dependencies for the node package and for forge commands

```sh
yarn
npm install
forge build
source .env
```

## Set up .env file

Rename `.env.example` file in the root project folder to `.env` and add the credentials accordingly.

## Run the Foundry scripts

1. Verify network data -

```sh
forge script ./script/VerifyDataExample.s.sol:VerifyNetworkInferenceDataExample --rpc-url $rpcUrl --broadcast --skip-simulation -vvvv
```

2. Retrieve the topic value -

```sh
forge script ./script/RetrieveTopicValue.s.sol:RetrieveTopicValue --rpc-url $rpcUrl --broadcast --skip-simulation -vvvv
```

## Run the Typescript scripts

1. Verify network data -

```sh
ts-node script/verifyDataExample.ts
```

2. Retrieve the topic value -

```sh
ts-node script/retrieveTopicValue.ts
```

**NOTE:** The scripts are using the already deployed consumer contract on Neon EVM Devnet with address [`0xB8D2EaB5961084a95B901131b55051425e614581`](https://neon-devnet.blockscout.com/address/0xB8D2EaB5961084a95B901131b55051425e614581?tab=index)

## Get the offchain topic inference from the API

1. Get the API Key [here](https://developer.allora.network/)

2. Query the already existing inference data from chain's API endpoint. For example -

```sh
curl -X 'GET' \
  --url 'https://api.allora.network/v2/allora/consumer/<chainId>?allora_topic_id=<topicId>' \
  -H 'accept: application/json' \
  -H 'x-api-key: <apiKey>'
```

3. Replace the inference data fields in the script with the new data from the previous step.
