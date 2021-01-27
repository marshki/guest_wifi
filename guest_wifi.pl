---------------------------------------------------------------
#! /usr/bin/perl

# __________________________________________  01.26.2021
#
# NAME
#
#   getguest 
#   
# SYNOPSIS
#
#   Get the nyu guest access and generate a html file with
#   with the info.
# ____________________________________________________________________

$ENV{"PATH"} = "/usr/bin:/usr/sbin:/bin:/sbin:";
$HOME = $ENV{"HOME"};
$guesthtml = "$HOME/html_local/sys/guest.html";
chomp ($today = `date`);


    # URL to get guest wifi

$url = "https://nyuroam-guest.nyu.edu/cgi-bin/index.pl";


    # *************************************
    # AUTHORIZATION
    # *************************************

chomp ($n = `basename $HOME`);
  [ Removed ]

$roam = `curl -u "${m}:${g}" "$url" | grep table | grep Guest | grep Password`;




    # *************************************
    # GENERATE HTML FILE
    # *************************************

    # generate the html file containing the nyu roam guest wifi pw

open (G, ">$guesthtml");
print G  <<ENDOFHTML;
<html><head>
<title>NYU Roam Guest</title></head>
<body bgcolor="#ffffff">

<p>
<h2>NYURoam Wireless Guest Password</h2>
</p>

<b><i><font color="#008000" size=+2>This is good until this coming Sunday midnight.</font></i></b><br>
Generated on:  $today<br><br><br>
$roam

<br><br><br>
To use, connect to nyuguest from the list of wireless networks, then open a web browser and enter the above Guest ID and Password when prompted. If you are unable to see the nyuguest network, you should instead connect to nyuguest-legacy.
<br><br><br>
<br><br><br>
<br><br><br>

Problems with this web page?  Please email <a href="shh">shh</a><br>

</body></html>

ENDOFHTML

close (G);
