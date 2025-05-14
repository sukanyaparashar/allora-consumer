// SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

import '../lib/forge-std/src/Script.sol';

import { IAlloraConsumer, TopicValue, AlloraConsumerNetworkInferenceData } from '../src/interface/IAlloraConsumer.sol';
import { Ownable2Step } from "../lib/openzeppelin-contracts/contracts/access/Ownable2Step.sol";
import { EnumerableSet } from "../lib/openzeppelin-contracts/contracts/utils/structs/EnumerableSet.sol";

// forge script ./script/RetrieveTopicValue.s.sol:RetrieveTopicValue --rpc-url $rpcUrl --broadcast --skip-simulation -vvvv

/**
 * @title RetrieveTopicValue
 * @notice Example contract for viewing a prediction for a topic 
 */
contract RetrieveTopicValue is Script {

    // Sepolia consumer Address
    IAlloraConsumer constant ALLORA_CONSUMER = IAlloraConsumer(0xB8D2EaB5961084a95B901131b55051425e614581);
    uint256 constant TOPIC_ID = 1;

    function run() public virtual {
        uint256 scriptRunnerPrivateKey = vm.envUint('privateKey');

        vm.startBroadcast(scriptRunnerPrivateKey);
        console.log('Broadcast started by %s', vm.addr(scriptRunnerPrivateKey));

        TopicValue memory topicValue = ALLORA_CONSUMER.getTopicValue(TOPIC_ID, '');

        console.log('Recent Value: %d', topicValue.recentValue);
        console.log('Recent Value Timestamp: %d', topicValue.recentValueTime);
    }
}
