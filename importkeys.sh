while read keyid
do
  gpg --recv $keyid
done < keys.all
