# Near_Guide

<img width="449" alt="Знімок екрана 2022-08-05 о 17 18 43" src="https://user-images.githubusercontent.com/102728347/183096536-8b6ac0dd-a1fa-4993-bf1a-c04cb386aa4d.png">

* [Встановлення node](https://github.com/MaxMavaIll/near_guide/blob/main/README.md#%D0%B2%D1%81%D1%82%D0%B0%D0%BD%D0%BE%D0%B2%D0%BB%D0%B5%D0%BD%D0%BD%D1%8F-node)
* [Створення гаманця](https://github.com/MaxMavaIll/near_guide/blob/main/README.md#c%D1%82%D0%B2%D0%BE%D1%80%D0%B5%D0%BD%D0%BD%D1%8F-%D0%B3%D0%B0%D0%BC%D0%BD%D1%86%D1%8F)
* [Cтворення валідатора](https://github.com/MaxMavaIll/near_guide/blob/main/README.md#%D1%81%D1%82%D0%B2%D0%BE%D1%80%D0%B5%D0%BD%D0%BD%D1%8F-%D0%B2%D0%B0%D0%BB%D1%96%D0%B4%D0%B0%D1%82%D0%BE%D1%80%D0%B0)
* [Створення автоматичного пінга](https://github.com/cybernekit/Near_Guide/blob/main/README.md#%D1%81%D1%82%D0%B2%D0%BE%D1%80%D1%8E%D1%94%D0%BC%D0%BE-%D0%BF%D1%96%D0%BD%D0%B3%D1%86%D0%B5-%D1%82%D0%B0%D0%BA%D0%BE%D0%B6-%D0%B2%D0%B0%D0%B6%D0%BB%D0%B8%D0%B2%D0%B0-%D1%87%D0%B0%D1%81%D1%82%D0%B8%D0%BD%D0%B0-%D0%B4%D0%BB%D1%8F-%D1%81%D1%82%D0%B2%D0%BE%D1%80%D0%B5%D0%BD%D0%BD%D1%8F-%D0%B2%D0%B0%D0%BB%D1%96%D0%B4%D0%B0%D1%82%D0%BE%D1%80%D0%B0)



## Встановлення node

Заходимо в root користувача
```
sudo su
```

```
sudo apt update && sudo apt upgrade -y

```
```
curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash -  
sudo apt install build-essential nodejs
PATH="$PATH"

```

```
sudo apt install -y git binutils-dev libcurl4-openssl-dev zlib1g-dev libdw-dev libiberty-dev cmake gcc g++ python docker.io protobuf-compiler libssl-dev pkg-config llvm cargo

```
```
sudo apt install clang build-essential make

```
```
sudo apt install curl jq
curl -sL https://deb.nodesource.com/setup_18.x | sudo -E bash -  

```
```
sudo apt install nodejs
PATH="$PATH"

```

Перевіряємо версії
```
node -v && npm -v

```
<img width="225" alt="Знімок екрана 2022-07-30 о 16 18 48" src="https://user-images.githubusercontent.com/102728347/181916319-705da541-48ac-4d09-bda7-d38980ddfdc6.png">

Устанавливаем NEAR-CLI
```
sudo npm install -g near-cli

```
<img width="532" alt="Знімок екрана 2022-07-30 о 16 21 56" src="https://user-images.githubusercontent.com/102728347/181916300-e026ef96-07f6-4a7c-8a5e-b8c4e7e31880.png">

Налаштовуємо оточення. Поточний тест проходить у мережі shardnet. Вводимо назву мережі як змінну
```
export NEAR_ENV=shardnet
echo 'export NEAR_ENV=shardnet' >> ~/.bashrc

```


Встановлюємо та налаштовуємо Python pip
```
sudo apt install python3-pip
USER_BASE_BIN=$(python3 -m site --user-base)/bin
export PATH="$USER_BASE_BIN:$PATH"

```

Встановлюємо Rust
```
sudo apt install curl build-essential gcc make -y
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
# Вибираємо -> 1) Proceed with installation (default)
```
```
source ~/.profile
source ~/.cargo/env

```
<img width="576" alt="Знімок екрана 2022-07-30 о 16 36 54" src="https://user-images.githubusercontent.com/102728347/181917044-1449dbb5-49a1-4aa7-bb56-0b85c096f3dc.png">



Встановлюємо репозиторій
```
git clone https://github.com/near/nearcore
cd nearcore
git fetch
#Обов'язково провіряємо чи це нова версія
git checkout c1b047b8187accbf6bd16539feb7bb60185bdc38

```

Збираємо бінарні файли
```
cargo build -p neard --release --features shardnet

```
<img width="550" alt="Знімок екрана 2022-07-30 о 17 18 32" src="https://user-images.githubusercontent.com/102728347/181918497-a957bb7a-47e8-4e33-8ffa-f8441a65ad2d.png">

Ініціалізуємо ноду та завантажуємо генезис файл
```
./target/release/neard --home ~/.near init --chain-id shardnet --download-genesis

```

Завантажуємо файл конфігурацій
```
rm ~/.near/config.json
wget -O ~/.near/config.json https://s3-us-west-1.amazonaws.com/build.nearprotocol.com/nearcore-deploy/shardnet/config.json

```

Завантажуємо снепшот
```
sudo apt-get install awscli -y
cd ~/.near
aws s3 --no-sign-request cp s3://build.openshards.io/stakewars/shardnet_noarchive/data.tar.gz .
tar -xzvf data.tar.gz

```

Запускаємо ноду 
```
cd ~
cd nearcore 
./target/release/neard --home ~/.near run

```
Ви повіні побачити як пізшла загрузка і вдсотки обов'язково повинні збільшуватися

<img width="1307" alt="Знімок екрана 2022-08-01 о 16 49 51" src="https://user-images.githubusercontent.com/102728347/182184400-d5277b2c-5949-4434-906c-5ee3638f55f5.png">

Тепер можна зупинити Cntr+C і створюємо сервісник
```        
echo "[Unit]
Description=NEARd Daemon Service

[Service]
Type=simple
User=root
WorkingDirectory=/root/.near
ExecStart=/root/nearcore/target/release/neard run
Restart=on-failure
RestartSec=30
KillSignal=SIGINT
TimeoutStopSec=45
KillMode=mixed

[Install]
WantedBy=multi-user.target"  | tee -a /etc/systemd/system/neard.service

```

Запускаємо сервісник
```
sudo systemctl daemon-reload
sudo systemctl enable neard
sudo systemctl restart neard

```

Команда для провірики логів
Тут також повинно показуватися що іде завантаження headers
```
journalctl -u neard -f -o cat

```
Коли воно загрузиться ви побачите такі логи

<img width="1388" alt="Знімок екрана 2022-08-01 о 18 30 52" src="https://user-images.githubusercontent.com/102728347/182185558-36e9aa54-006f-40f3-aeff-cc5dba7320e5.png">


Провіряємо синхронізацію 
```
curl -s http://127.0.0.1:3030/status | jq .sync_info

```
Якщо синхронізація показує false тоді можна переходити до наступного розділу

<img width="553" alt="Знімок екрана 2022-08-01 о 18 34 27" src="https://user-images.githubusercontent.com/102728347/182186039-330f7703-d0a4-4151-93a1-91e99e845842.png">


## Cтворення гамнця
Переходимо по силці [create_wallet](https://wallet.shardnet.near.org/) і створюємо гамонець.
Обов'зково!!!
Не забуть зберегти сід фрази.

Замінюємо moniker на свій нік
```
MONIKER=<MONIKER>
```
```
POOL=$MONIKER.factory.shardnet.near
ACCOUNT_ID=$MONIKER.shardnet.near

```

## Створення валідатора

```
near login
# Водимо адрес в браузер https://wallet.shardnet.near.org/login/****
```

Підтвержуємо всі запити
<img width="1384" alt="Знімок екрана 2022-08-03 о 17 17 33" src="https://user-images.githubusercontent.com/102728347/182631672-d038118d-8047-4ffe-8eed-2c646fbb757a.png">

<img width="1386" alt="Знімок екрана 2022-08-03 о 17 19 46" src="https://user-images.githubusercontent.com/102728347/182631923-5e9cfc85-73c1-4691-af79-a0b5ec714d68.png">

<img width="386" alt="Знімок екрана 2022-08-01 о 18 45 42" src="https://user-images.githubusercontent.com/102728347/182188462-a11fcb15-5c8c-4eb6-b19c-a0deed819320.png">

Далі коли ви пройдете ви отримаєте помилку 403 Not Fount.

Після цього переходимо в термінал і водимо ваш ACCOUNT_ID
Це повинно виглядати так

<img width="1180" alt="Знімок екрана 2022-08-01 о 18 52 01" src="https://user-images.githubusercontent.com/102728347/182189875-ee3312a1-a697-4ba9-8278-ed9db2a13bab.png">



Тепер створюєм ключі валідатора
```
near generate-key $ACCOUNT_ID

```
Робимо деякі зміни у створившимуся файлі 
```
sed -i 's/private_key/secret_key/' ~/.near-credentials/shardnet/$ACCOUNT_ID.json
sed -i s/$ACCOUNT_ID/$POOL/ ~/.near-credentials/shardnet/$ACCOUNT_ID.json
```
Копіюємо ключ у іншу дерикторію і перейменовуємо
```
cp ~/.near-credentials/shardnet/$ACCOUNT_ID.json ~/.near/validator_key.json

```

І перезапускаємо ноду
```
sudo systemctl daemon-reload
sudo systemctl enable neard
sudo systemctl restart neard

```

Це ще не все для того щоб створити валідатора ми повинні виконати ще деякі дії
В даний скрипт ми повинні замінити `public_key` на ваш публічний ключ

```
near call factory.shardnet.near create_staking_pool '{"staking_pool_id": "$MONIKER", "owner_id": "$ACCOUNT_ID", "stake_public_key": "<public key>", "reward_fee_fraction": {"numerator": 5, "denominator": 100}, "code_hash":"DD428g9eqLL8fWUxv8QSpVFzyHi1Qd16P8ephYCTmMSZ"}' --accountId="$ACCOUNT_ID" --amount=30 --gas=300000000000000
```

Також потрібно  закинути відповідну суму для того, щоб валідатор був у валідному сеті
```
near call $MONIKER deposit_and_stake --amount <amount> --accountId $ACCOUNT_ID --gas=300000000000000 
```
Якщо вам потрібно інші комади перейдіть по цій силці [commands](https://github.com/cybernekit/Near_Guide/blob/main/commands.md)

# Створюємо пінг(це також важлива частина для створення валідатора)
Встановлюємо такий скрипт
```
wget -P ~/ https://github.com/cybernekit/Near_Guide/blob/main/ping.sh && chmod +x ~/ping.sh 
mkdir -p $HOME/logs
```
Втановлюємо crontab якщо він у вас не встановлений і відкриваємо редактор де будемо задавати зміни
```
apt install crontab
crontab -e

```
Якщо ви раніше не користувалися ним вам дадуть вибір який використовувати редактор(я буду користуватися nano)
Тепер вставляємо таку фразу в кінець списку 
```
0 */2 * * * bash /root/ping.sh
```
