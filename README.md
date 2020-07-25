# AZUBI 
 Assignment1

Created a database with PostgreSQL and PgAdmin
Populated it with dummy information from a csv file.
Executed the queries to solve the questions.

Number 1 


Number 2
Transfer is denoted by various kinds, including:
        - Wave to wave 
        - Wave to mobile 
        - Bill payment and other payments
Transfer_id, u_id and source_wallet_id are compared to ensure exist and match
Source_wallet_id with wallet_id to ensure they exist and match 
The send_amount_currency is checked to validate if its CFA. 

Number 3
Number of users who made transfers without repetition. 

Number 4
Total number of agent transaction  
    -Compare agents in the agents table to  agents in the agent transaction  -year 2018 with an order of months.

Number 5
 Net depositors are agents who have amounts < 0
Net withdrawers find agents who have amounts > 0

Number 6
Volume by finding the count of the transactions in a week then group it by city. 

Number 7
Volume by finding the count of the transactions in a week then group it by city and country

Number 8
Volume of send_amount_scalar 
Group by country and transfer kind. 

Number 9
Transaction count. 

Number 10
The source wallet corresponds to the wallets wallet_id
Find scalar amount greater than 10 mil and in CFA for a week. 


