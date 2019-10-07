# keysigning

See https://cwiki.apache.org/confluence/display/apachecon/PgpKeySigning for public page doc.

The key id, names and email are collected via a google export.

Get a zip file from "Download Response" in the form.

Unzip the file containing the Responses

unzip Event\ Registration.csv.zip

Process the Response to a list of key id, the list is in keys.all and import the key locally:

bash keys.sh

bash importkeys.sh

If something goes wrong... Normal email the guy with the key, ask to check the process.

The most common errors are:

1 - The keyid is broken (the missed copy+paste)

2 - The key is not in the key server (ask where the guy sent the key, you should be able to get it there.

3 - The key server is broken...  Well try another one, email jfclere@gmail.com!)

Once the key are in keys.all file generate the keyring and html page.

./party-table-new.pl keys.all > out.html

bash keyring.sh

Send the file to people.apache.org (using you apache id) check sftp.batch for the location...
Use sftp like:

ftp jfclere@people.apache.org cd public_html; mkdir 2019NAKeyring.

sftp -b sftp.batch jfclere@people.apache.org

READY for the party!!!

After the party you might remove for the keyring the people that doesn't show up at the party :-(
