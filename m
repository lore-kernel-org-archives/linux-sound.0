From: qozmo x xx <qozm0@juno.com>
Date: Sun, 25 Apr 1999 18:48:18 +0000
Subject: Re: why no midi?
Message-Id: <marc-linux-sound-92506571221038@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92467332609462@msgid-missing>
In-Reply-To: <marc-linux-sound-92467332609462@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org



On Wed, 21 Apr 1999 22:05:26 -0400 Bill Nottingham <notting@redhat.com>
writes:
>
>playmidi as shipped in RH 5.2 is broken for FM synth; either upgrade
>to a later release, or do:
>
>cd /etc/midi
>for foo in *; do ln -s midi/$foo ../$foo ; done
>
>That should fix the problem.
>
>Bill
>

ok, i did try that command, and it worked, now i can play midi.
what exactly did this command line do (and what is foo?)?
thanx for the help,
qozmo
___________________________________________________________________
You don't need to buy Internet access to use free Internet e-mail.
Get completely free e-mail from Juno at http://www.juno.com/getjuno.html
or call Juno at (800) 654-JUNO [654-5866]
