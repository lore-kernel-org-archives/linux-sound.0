From: "Cummings, Kevin" <kcummings@clariion.com>
Date: Wed, 19 May 1999 18:55:59 +0000
Subject: Can't get AZT1008 sound card to work under RH6.0
Message-Id: <marc-linux-sound-92729623832366@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hello,
	I just installed RH6.0 on my HP Vectra computer (which runs NT 4.0SP4).
I'm having problems getting my sound card working.  I ran "sndconfig", and it found the ISA-PnP card, and (I assume) it ran "pnpdump" to dump the sound card's PnP info to a file.  Then (I assume) it ran "isapnp" on the configuration file it created, which produced an error message.  At that point, "sndconfig" wants me to select my sound card manually.  This is the point where I think that things start going from bad to worse.  I stared at the isapnp.conf file (as it now was), and editted it such that "isapnp" was happy with it (no error messages).  Now, when I try and load the sound module (whichever one was left configured from "sndconfig" program), it seems to work for the OPL-3 part of the sound driver, but the other parts claim that the ports are already in use????

	Can someone help me out here?  I can provide details with a little rebooting and moving of data files without too much trouble.

	AFAIK, HP has OEMed an Aztech sound card which uses the AZT 2320 chipset.  NT claims it is an Aztech Pro 16V-A PnP card, but Aztech lists no such card on its WWW site.  It does list a couple of cards which use the AZT2320 chipset, and only one of those is an ISA card.  (Should I assume they are the same card????)

	The big question is what addresses to use for which ioports.  The answers seems to be 0x220, 0x534, IRQ 5, and DMA 0 and 1 for NT.

	The isapnp.conf file looks like (simplified):
AZT1008 PnP Sound Device
LD 0	IDE CDROM DISABLED
	IO 0 BASE 0x530
	IO 1 BASE 0x330
LD 1	AUDIO
	IO 0 BASE 0x220
(do I want more than 1 IO device here????  IO 1 0x388??  IO 2 0x534 ???)
	INT 0 IRQ 5 MODE +E
	DMA 0 CHANNEL 0
	DMA 1 CHANNEL 1
(I commented out an "extra" INT 0 IRQ 5 line under this LD [but different dependent function] which was causing an error when the file was being loaded at boot time!)
LD 2	MPU401 MIDI
(nothing defined here!  I assume I want IO 0 0x330, IRQ 9???)
LD 3	GAME PORT
(again, nothing defined here!  I assume I want IO 0 0x200???)

The sound module (/etc/conf.modules) thinks it is loading an Aztech Sound Galaxy driver.  Is this right????
The Aztech source code seems to think so!

Is my configuration correct?  If so, why won't the sound driver work??  Have I chosen the right sound driver?  If not, what should it be???

I can forward my exact configuration and my exact messages if someone wants to help me.  Thanks!

I'm hoping that there is a SIMPLE solution for this mess!

(I'm stuck on a crappy NT box using Outhouse until I get my Linux config straightened out!)

Kevin J. Cummings
kcummings@clariion.com
