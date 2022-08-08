# Команди для різних операцій

* Unstake and Unstake All
```
near call <staking_pool_id> unstake '{"amount": "<amount yoctoNEAR>"}' --accountId <accountId> --gas=300000000000000
```
```
near call <staking_pool_id> unstake_all --accountId <accountId> --gas=300000000000000
```
* Зняти або Зняти всю суму. 
```
near call <staking_pool_id> withdraw '{"amount": "<amount yoctoNEAR>"}' --accountId <accountId> --gas=300000000000000
```
```
near call <staking_pool_id> withdraw_all --accountId <accountId> --gas=300000000000000
```
* Доступний для виведення. Ви можете зняти кошти з контракту, лише якщо вони розблоковані.
```
near view <staking_pool_id> is_account_unstaked_balance_available '{"account_id": "<accountId>"}'
```
* Подивитися стейк баланс.
```
near view <staking_pool_id> get_account_staked_balance '{"account_id": "<accountId>"}'
```
* розтейкання балансу.
```
near view <staking_pool_id> get_account_unstaked_balance '{"account_id": "<accountId>"}'
```
* Призупинити / Відновити стейк.
```
near call <staking_pool_id> pause_staking '{}' --accountId <accountId>
```
```
near call <staking_pool_id> resume_staking '{}' --accountId <accountId>
```
