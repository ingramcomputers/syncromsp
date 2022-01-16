Sometimes you need to do some task that you just cannot do in Syncro but you still want to charge time. I wanted to do firewall backups and save them to a local folder that all my techs can access. I can't do that on the customer's devices. I didn't want to upload it to a device because managing attachments in Syncro is a pain in the butt.

This will do the following:
- Create the ticket
- Add 30 minutes to the Labor Log
- Then charge the time entry

This creates a ticket using the API. 

The script is not designed to run inside Syncro.

You will need to change the variables at the top.
- SyncroSubdomain - Your Syncro subdomain name
- SyncroAPIKey - API Key
- SyncroID - Customer ID. To get this go to the customer and look for the number at the end of the URL.
- tsubject - The subject of the ticket
- tstatus - The status of the ticket
- ttype - The type of ticket

API Permissions - Make sure you have these checked
- Tickets - Create
- Ticket Comments - New
- Ticket Timers - Overview
- Timelogs - Manage

There might be more permissions needed. It is common sense figuring out which ones.

I used the examples at https://gist.github.com/theinventor/f765c14ee5cda25a0e94df00dc61ffae to create this script. Much of it is copied. Just trying to make it easier.
