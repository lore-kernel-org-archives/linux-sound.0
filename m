From: Bill Nottingham <notting@redhat.com>
Date: Fri, 06 Nov 1998 17:39:21 +0000
Subject: Re: pci soundcard
Message-Id: <marc-linux-sound-91037378802959@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91035185025862@msgid-missing>
In-Reply-To: <marc-linux-sound-91035185025862@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Andreas Jellinghaus (aj@dungeon.inka.de) said: 
> i'm sick of isa and pnp, so i think of replaceing my soundcard.
> is there a working pci sound card for linux (not too expensive) ?
> for example what about the soundblaster 128 pci ?

Supported PCI sound cards in the kernel are:

- Ensoniq ES1370
 (this includes the Sound Blaster PCI 64/128)
- Creative/Ensoniq ES1371
- S3 SonicVibes

Drivers for these are available at
 http://www.ife.ee.ethz.ch/~sailer/linux/pciaudio.html

They're include in 2.1.109+, and Alan Cox's sound backport
to 2.0.x.

If you're willing to pay for drivers, OSS may have support
for other PCI cards (see http://www.opensound.com/osshw.html).

Bill
