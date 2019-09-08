keys=""
for key in `cat keys.all`
do
  keys="${keys} ${key}"
done
echo $keys
gpg --export --armor --output keyring $keys
