From: Hal MacArgle <haltec@iceweb.net>
Date: Sat, 29 Dec 2001 17:02:15 +0000
Subject: esssolo1 PCI tool??
Message-Id: <marc-linux-sound-100964550216361@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Greetings: I have an esssolo1 card that works fine on two machines
with Award BIOS - Slackware7.1, using the esssolo1.o module..

However, moving it to an AMI BIOS MB machine I can't get esssolo1.o
to load.. Have removed all other cards that might conflict I/O or IRQ
wise, except the onboard 2 Ser and 1 Par.. Tried under Slack7.1 and,
also, RedHat 6.2.. Both NG with RH not finding the card using
'sndconfig'...???...

The BIOS mention is probably a coincidence but I was wondering if
there is a PCI device tool program other than the normal cat /proc
and lspci available, so I might learn something about PCI cards..

I note the opening screen on the AMI BIOS machine reports the PCI
VGA card and onboard's, but can't "see" the sound card???

I don't run Windows on any machine so I can't use the diagnostic
programs on the CD supplied with the card, if there is one..

I'm mystified. Any suggestions? TIA.

    Hal - in Terra Alta, WV  -  Slackware Linux 7.1   (2.2.16)
	         email:        haltec@iceweb.net
.
