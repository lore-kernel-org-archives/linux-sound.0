From: Paul Laufer <pelaufer@csupomona.edu>
Date: Wed, 19 Apr 2000 02:37:57 +0000
Subject: Re: Missing 16bit DMA channel
Message-Id: <marc-linux-sound-95611197122837@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95606803212331@msgid-missing>
In-Reply-To: <marc-linux-sound-95606803212331@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Tue, 18 Apr 2000, Peter Leif Rasmussen wrote:

> I have mentioned this before and I'm sure you are sick of it, but having
> investigated some more I am actually more confused about this issue than ever.
>
[SNIP]
> 
> Could someone please tell me what I am missing here?
> 
> Thank you very much,
> 
> Peter

Peter,

Could you please send me a copy of your /proc/isapnp from a 2.3.99 kernel
(if not available a copy of the output from pnpdump would work)? The copy
I have, for the Creative ViBRA16C PnP, shows that the card actually asks
for a 16 bit DMA. This goes against what I've heard about these cards,
that they need two 8 bit DMAs. If your card is also asking for a 16 bit
dma, then it is not the fault of the kernel but a hardware bug, which
needs a isapnp quirk written for it (I'll write it if you test it).

Anyway, I'd appreciate a copy of your /proc/isapnp anyway. Perhaps I
should start a database . . . Or is there one available?

Thanks,
Paul Laufer
