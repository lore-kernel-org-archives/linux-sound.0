From: Peter Leif Rasmussen <plr@cedara.com>
Date: Mon, 28 Feb 2000 15:05:56 +0000
Subject: Re: [PATCH] Yet another sound/oss cleanup
Message-Id: <marc-linux-sound-95175223707752@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95168245928396@msgid-missing>
In-Reply-To: <marc-linux-sound-95168245928396@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

This sounds (no pun ...) great and as you mention "<dma>,<dma2>" it triggered
the following question.

By accident I bought a motherboard with a SB Vibra16 on it and that can't be
diabled, thinking it was a straightforward SB16 as I have on another machine.
It isn't because it doesn't have a 16bit DMA channel, but only two 8bit DMA
channels.

Because of that the driver won't take more than one DMA channel (one of the
8bit) and the sound system is now not duplex-able. That seems obvious as the
SB driver is always loaded with "dma=N dma16=M" (N=[0,1,2,3], M=[4,5,6,7]).

However, you write it as dma and dma2 with the ad1816 driver so I was wondering
if there is anything that hinders an otherwise (it seems) SB16 lookalike to
to have the second DMA channel load also as 8bit? Do ad1816 cards have one 8bit
and one 16bit as SB16 has it or some other configuration?

I can play .wav and .mp3 files with the SB Vibra16 using the SB driver, so
something must be working right. I would also like to use it in duplex mode
for IP-phone on my network and would like to know what it takes?

I understand the difference with 8 and 16bit, but don't know what difference
it makes on a soundcard, so if anyone could tell me or tell me what article
or manual to read I would aprpeciate it. Playing the .wav and .mp3 files
doesn't sound any different on this SB Vibra16 than on a SB16, which is why
I am wondering what is going on?

Thanks,

Peter

Christoph Hellwig wrote:
> 
> After I've removed the legacy defines of the old oss code, this is another step towards a clean
> sound code.
> 
> This patch is at this time only for one sound card (ad1816), but if gets accepted I'll patch
> all sound cards in this way.
> 
> It removes the need to put each soundcard in the ugly sound_drivers[] array in dev_table.h and
> now you don't have to compile the irq/io/dma values into the kernel image. Instead they can be
> specified on the kernel comandline using soundcard=<io>,<irq>,<dma>,<dma2>.
> 
> Christoph
> 
> --
> Always remember that you are unique.  Just like everyone else.
> 
I like that .sig :-)
