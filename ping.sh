#!/bin/sh
# Ping call to renew Proposal added to crontab

export NEAR_ENV=shardnet
export LOGS=/root/logs

echo "---" >> $LOGS/all.log
date >> $LOGS/all.log
near call $MONIKER.factory.shardnet.near ping '{}' --accountId $MONIKER.shardnet.near --gas=300000000000000 >> $LOGS/all.log
near proposals | grep $MONIKER >> $LOGS/all.log
near validators current | grep $MONIKER >> $LOGS/all.log
near validators next | grep $MONIKER >> $LOGS/all.log
