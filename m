From: Hal MacArgle <haltec@iceweb.net>
Date: Sun, 30 Dec 2001 15:22:03 +0000
Subject: esssolo1 PCI tool?? Solved.
Message-Id: <marc-linux-sound-100972690111499@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Greetings: Found a work around.. This MB has a defunct on board sound
lashup that I disabled with the BIOS when adding the new sound card..
Apparently that turns the BIOS "off" as far as ANY sound cards go..
Enabling that and RH6.2 sndconfig found the solo1 card and set it
up.. All is now, more or less, except I feel the card is crippled
under this setup but it does work playing CD's, albeit at a lower
than "normal" volume setting. <grin>

The normal cat /proc's are OK now except /proc/dma doesn't list the
card at all so -- we'll see.. I would still like to find a Linux
diagnostic program over and above the cat /proc route.. I can't help
but wonder how many of the M572 MB's were trashed because the on
board sound amplifiers went kaput?

Cheers,

Hal

On Sat, Dec 29, 2001 at 05:02:15PM +0000, Hal MacArgle wrote:
> Greetings: I have an esssolo1 card that works fine on two machines
> with Award BIOS - Slackware7.1, using the esssolo1.o module..
> 
> However, moving it to an AMI BIOS MB machine I can't get esssolo1.o
> to load.. Have removed all other cards that might conflict I/O or IRQ
> wise, except the onboard 2 Ser and 1 Par.. Tried under Slack7.1 and,
> also, RedHat 6.2.. Both NG with RH not finding the card using
> 'sndconfig'...???...
> 
> The BIOS mention is probably a coincidence but I was wondering if
> there is a PCI device tool program other than the normal cat /proc
> and lspci available, so I might learn something about PCI cards..
> 
> I note the opening screen on the AMI BIOS machine reports the PCI
> VGA card and other onboard's, but can't "see" the sound card???
> 
> I don't run Windows on any machine so I can't use the diagnostic
> programs on the CD supplied with the card, if there is one..
> 
> I'm mystified. Any suggestions? TIA.
> 
>     Hal - in Terra Alta, WV  -  Slackware Linux 7.1   (2.2.16)
> 	         email:        haltec@iceweb.net
> .
