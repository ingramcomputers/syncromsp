This scripted is designed to run Fab's Auto Backup 7 and save to a server share on the local network. We use it to backup profiles in our computer repair shop.

You will need to create the following variables:
- customer {{customer_business_name_or_customer_full_name}}
- asset {{asset_name}}
- Source - Dropdown - C,D,E,F,G
- Run as Logged in User

It will save in the specified location at:

"\\server\share\YYMMDD Customer Name\Asset Name\"

"\\server\share\20220120 John Doe\JOHN-PC\"
