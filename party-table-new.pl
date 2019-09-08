#! /usr/bin/perl -w
use strict;
use utf8;

print "<HTML><HEAD><TITLE>ApacheCon NA 2019 PGP Keysigning Key List</TITLE><meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\"></HEAD>\n";
print "<BODY><H1>ApacheCon NA 2019 PGP Keysigning Key List</H1><TABLE BORDER=1>\n";
print "<TR><TH>&nbsp;</TH><TH>Key ID</TH><TH>Owner</TH><TH>Fingerprint</TH>";
print "<TH>Size</TH><TH>Type</TH><TH>Key Info Matches?</TH><TH>Owner ID Matches?</TH></TR>\n";

my @ids = <>;

my $i = 0;
while (my $id = shift(@ids)) {
    my @fp = `gpg --fingerprint --no-options --with-colons --display-charset utf-8 $id`;
    chomp @fp;
    my @fpdata; 
    my $fingerprint;
    while (my $line = shift(@fp)) {
#        print "$line\n";
        if ($line =~ m/^pub/) {
            @fpdata = split /:/, $line;
        } elsif ($line =~ m/^fpr/) {
            my (undef,undef,undef,undef,undef,undef,undef,undef,undef,$foo)
                = split /:/, $line;
            $fingerprint = $foo;
        } else {
            next;
        }
    }
    my ($pub,$comptrust,$size,$type,$longid,$date,undef,
        undef,$settrust,$owner,undef,undef,$flags,undef) = @fpdata;

    if($type eq '17') {
        $type = 'DSA';
    } elsif($type eq '20') {
        $type = 'El Gamal';
    } elsif($type eq '1') {
        $type = 'RSA';
    }
    if(length($fingerprint) == 40) {
        for my $i (36,32,28,24,20,16,12,8,4) {
            if($i != 20) {
                substr($fingerprint,$i,0,' ');
            }
            if($i == 20) {
                substr($fingerprint,$i,0,"\n");
            }
        }
    } elsif (length($fingerprint) == 32) {
        for my $i (30,28,26,24,22,20,18,16,14,12,10,8,6,4,2) {
            if($i != 16) {
                substr($fingerprint,$i,0,' ');
            }
            if($i == 16) {
                substr($fingerprint,$i,0,"\n");
            }
        }
    }
    $owner =~ s/&/&amp;/;
    $owner =~ s/</&lt\;/;
    $owner =~ s/>/&gt\;/;

    ++$i;

    print "<TR><TD>$i</TD><TD><PRE>$id</PRE></TD><TD>$owner</TD>\n";
    print "<TD><PRE>$fingerprint</PRE></TD><TD>$size</TD>\n";
    print "<TD>$type</TD><TD>&nbsp;</TD><TD>&nbsp;</TD></TR>\n";
}



print "<TR><TD>&nbsp;<BR>&nbsp;</TD><TD></TD><TD></TD><TD></TD><TD></TD><TD></TD><TD></TD><TD></TD></TR>\n";
print "<TR><TD>&nbsp;<BR>&nbsp;</TD><TD></TD><TD></TD><TD></TD><TD></TD><TD></TD><TD></TD><TD></TD></TR>\n";
print "<TR><TD>&nbsp;<BR>&nbsp;</TD><TD></TD><TD></TD><TD></TD><TD></TD><TD></TD><TD></TD><TD></TD></TR>\n";
print "<TR><TD>&nbsp;<BR>&nbsp;</TD><TD></TD><TD></TD><TD></TD><TD></TD><TD></TD><TD></TD><TD></TD></TR>\n";
print "<TR><TD>&nbsp;<BR>&nbsp;</TD><TD></TD><TD></TD><TD></TD><TD></TD><TD></TD><TD></TD><TD></TD></TR>\n";
print "<TR><TD>&nbsp;<BR>&nbsp;</TD><TD></TD><TD></TD><TD></TD><TD></TD><TD></TD><TD></TD><TD></TD></TR>\n";
print "<TR><TD>&nbsp;<BR>&nbsp;</TD><TD></TD><TD></TD><TD></TD><TD></TD><TD></TD><TD></TD><TD></TD></TR>\n";
print "<TR><TD>&nbsp;<BR>&nbsp;</TD><TD></TD><TD></TD><TD></TD><TD></TD><TD></TD><TD></TD><TD></TD></TR>\n";
print "<TR><TD>&nbsp;<BR>&nbsp;</TD><TD></TD><TD></TD><TD></TD><TD></TD><TD></TD><TD></TD><TD></TD></TR>\n";
print "<TR><TD>&nbsp;<BR>&nbsp;</TD><TD></TD><TD></TD><TD></TD><TD></TD><TD></TD><TD></TD><TD></TD></TR>\n";
print "<TR><TD>&nbsp;<BR>&nbsp;</TD><TD></TD><TD></TD><TD></TD><TD></TD><TD></TD><TD></TD><TD></TD></TR>\n";

print "</TABLE>\n";
print "</BODY></HTML>";
