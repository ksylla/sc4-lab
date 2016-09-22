#!/bin/bash

/wait-for-step.sh
/execute-step.sh

echo zookepper-init ZK_DOCKER=$ZK_DOCKER XXX=$XXX

/finish-step.sh

