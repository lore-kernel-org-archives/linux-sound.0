From: Keith Duthie <psycho@albatross.co.nz>
Date: Thu, 18 Feb 1999 03:11:38 +0000
Subject: Re: Sound Card Problems
Message-Id: <marc-linux-sound-91930765308819@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91922152200751@msgid-missing>
In-Reply-To: <marc-linux-sound-91922152200751@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Wed, 17 Feb 1999, Rodrigo Castro wrote:

> I tried your patch and it did not work. I saw something about the patch
> you send. It is only needed when DMA Hang is not detect. In my case,
> it is detected as well it is activated a workaround for it.
> 
> PCI: PCI BIOS revision 2.10 entry at 0xfafb0
> PCI: Using configuration type 1
> PCI: Probing PCI hardware
> PCI: 00:38 [1106/0586]: Work around ISA DMA hangs (00)
> Activating ISA DMA hang workarounds.
Ah, well. I think it's time I admitted I have almost no idea what your
problem is. Could you send me your .config file offlist? I doubt I can
help, based on the fact that it sounds like your sound card is doing weird
things. Have you tried isapnptools v1.18? Have you had a look in you bios
configuration to see if that is messing things up?

Suggestion: If you can, then reserve dma 1, 5 + irq 5 for isa in bios. I'm
not sure what benefit this could have, but OTOH, I don't think it'll cause
any more problems than you've already got. 
-- 
.sig under deconstruction. Please watch out for falling stars.
