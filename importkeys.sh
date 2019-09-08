while read keyid
do
  gpg --keyserver keyserver.ubuntu.com --recv $keyid
  if [ $? -eq 0 ]; then
    continue;
  fi
  gpg --keyserver hkps.pool.sks-keyservers.net --recv $keyid
  if [ $? -eq 0 ]; then
    continue;
  fi
  gpg --recv $keyid
  if [ $? -ne 0 ]; then
    echo "Can't find key: $keyid"
    continue;
  fi
done < keys.all
