From: Rodrigo Castro <rcastro@linux.ime.usp.br>
Date: Wed, 17 Feb 1999 17:38:23 +0000
Subject: Re: Sound Card Problems
Message-Id: <marc-linux-sound-91927538910643@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91922152200751@msgid-missing>
In-Reply-To: <marc-linux-sound-91922152200751@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Thu, 18 Feb 1999, Keith Duthie wrote:

> On Wed, 17 Feb 1999, Rodrigo Castro wrote:
> 
> > Tried everything. Not working. I don't even know if you have any more idea
> > about what may be the problem. My motherboard chipset is VIA and I read
> > something about a conflict between some VIA chipsets and sound cards. I
> > sent a message to linux-kernel list. Let's see if someone there gives us a
> > tip of what may not be working.
> > The worst thing is that it used to work in 2.0.36, but nowadays when I try
> > to revert to 2.0.36 kernel, it does not work more (with isapnptools). The
> > only way I found that works is initializing my card with a kernel patch in
> > a 2.0.* kernel.
> Try this patch, then recompile. If it works then the problem was the 
> motherboard.

Keith, 

I tried your patch and it did not work. I saw something about the patch
you send. It is only needed when DMA Hang is not detect. In my case,
it is detected as well it is activated a workaround for it.

PCI: PCI BIOS revision 2.10 entry at 0xfafb0
PCI: Using configuration type 1
PCI: Probing PCI hardware
PCI: 00:38 [1106/0586]: Work around ISA DMA hangs (00)
Activating ISA DMA hang workarounds.

[]'s
Rodrigo Castro   <rcastro@linux.ime.usp.br>
Computer Science undergraduate student - University of Sao Paulo
Rudeness is a weak man's imitation of strength.
