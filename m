From: "Adam Watson" <linuxacolyte@hotmail.com>
Date: Sat, 20 Oct 2001 19:36:25 +0000
Subject: Broken EMU10K1 Driver in 2.4.8+
Message-Id: <marc-linux-sound-100360658701245@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I noticed this around 2.4.8 but thought it to be just a glitch or that my 
sound card had crapped out on me.  So I tested SBLive card under Windows and 
it worked without a hitch.

My problem:

Kernel 2.4.12 recognizes the card but does not set the devices.  Following 
the Sound-HOWTO, I ran every test that it requested.  It passed all except 
when I would cat /dev/sndstat.

Output:

cat: /dev/sndstat: No such device

All device files are present and showing the right permissions. And the 
kernel recognizes the card at every boot up?  Has something changed recently 
that I need to reconfigure in my kernel?

Please help,
Adam W.

_________________________________________________________________
Get your FREE download of MSN Explorer at http://explorer.msn.com/intl.asp

