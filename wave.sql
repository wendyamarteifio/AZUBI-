-- ASSIGNMENT 1
-- Read README.md for thought process for all questions

--Number 1
SELECT COUNT (*) FROM users;

---Number 2
SELECT COUNT (transfer_id) 
FROM "WaveM".transfers, "WaveM".users
WHERE transfers.u_id = users.u_id
AND transfers.send_amount_currency = 'CFA';


--Number 3
SELECT COUNT (distinct users.u_id)
FROM "WaveM".transfers, "WaveM".users 
WHERE transfers.u_id = users.u_id
AND transfers.send_amount_currency='CFA';


--Number 4

SELECT COUNT (atx_id) AS agents_transactions,
extract(month from agent_transactions.when_created) as months
FROM "WaveM".agent_transactions, "WaveM".agents
WHERE agent_transactions.agent_id = agents.agent_id
AND agent_transactions.when_created 
BETWEEN '2018-01-01 00:00:00' AND '2018-12-31 23:59:59' group by 
agent_transactions.when_created;

--Number 5
--net depositors
SELECT COUNT (agents.agent_id) 
AS net_depositors 
FROM "WaveM".agent_transactions, "WaveM".agents
WHERE amount < 0 
AND agent_transactions.agent_id =agents.agent_id 
AND agent_transactions.when_created BETWEEN '2020-01-01 00:00:00' AND '2020-01-07 23:59:59';

-- net withdrawals
SELECT COUNT (agents.agent_id) 
AS net_withdrawal 
FROM "WaveM".agent_transactions, "WaveM".agents
WHERE amount > 0 
AND agent_transactions.agent_id =agents.agent_id 
AND agent_transactions.when_created BETWEEN '2020-01-01 00:00:00' AND '2020-01-07 23:59:59';


--Number 6
SELECT COUNT (atx_id) 
AS volume, City 
FROM "WaveM".agent_transactions,"WaveM".agents
WHERE agent_transactions.when_created BETWEEN '2020-01-01 00:00:00' AND '2020-01-07 23:59:59'
GROUP BY City;

--Number 7
SELECT COUNT (atx_id) 
AS volume, City, Country
FROM "WaveM".agent_transactions,"WaveM".agents
WHERE agent_transactions.when_created BETWEEN '2020-01-01 00:00:00' AND '2020-01-07 23:59:59'
GROUP BY City, Country;

--Number 8
SELECT ledger_location AS Country, kind AS transfer_kind,
COUNT(send_amount_scalar) 
AS volume 
FROM "WaveM".agent_transactions,"WaveM".wallets, "WaveM".transfers 
WHERE transfers.source_wallet_id= wallets.wallet_id
AND agent_transactions.when_created BETWEEN '2020-01-01 00:00:00' AND '2020-01-07 23:59:59'
GROUP BY Country,kind;




--Number 9
SELECT ledger_location AS Country, kind AS transfer_kind
, count(transfers.u_id) as transaction_count, count(distinct transfers.u_id) as
unique_users,
COUNT(send_amount_scalar) 
AS volume 
FROM "WaveM".agent_transactions,"WaveM".wallets, "WaveM".transfers, "WaveM".users 
WHERE transfers.source_wallet_id= wallets.wallet_id and transfers.u_id = users.u_id
AND agent_transactions.when_created BETWEEN '2020-01-01 00:00:00' AND '2020-01-07 23:59:59'
GROUP BY Country,kind;

--Number 10 
SELECT wallet_id, send_amount_scalar
FROM "WaveM".transfers,"WaveM".wallets 
WHERE wallets.wallet_id= transfers.source_wallet_id
AND transfers.send_amount_scalar >10000000
AND transfers.send_amount_currency='CFA' 
AND wallets.when_created BETWEEN'2020-01-01 00:00:00' AND '2020-02-01 23:59:59'