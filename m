From: Peter Rasmussen <plr@cedara.com>
Date: Mon, 27 Mar 2000 15:08:48 +0000
Subject: Re: [Patch] sb_card.c cleanup
Message-Id: <marc-linux-sound-95417021514924@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95415246500376@msgid-missing>
In-Reply-To: <marc-linux-sound-95415246500376@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

This all sounds great (no pun ... :-) and I would like to know if it while
doing this would be possible to allow the second DMA channel to be 8bit and 
not requiring it to be 16bit as it is today?

I and a fair amount of other people it seems, have SB Vibra cards that look
like SB16 cards, but have been handicapped by having two 8bit DMA channels 
instead of one 8bit and one 16bit. I need the second DMA channel for duplex.

Thank you very much,

Peter

gqueri@mail.dotcom.fr wrote:
>
>On Mon, Mar 27, 2000 at 02:19:17AM -0800, Paul Laufer wrote:
>> Hey all,
>> 
>> Alex told me to redo my previous sb_card.c cleanup patch after he got his
>> into the kernel. So here is a new version, against 2.3.99pre3.
>> 
>> Overview: After Alex's last patch the various sb_init_* functions were
>> quite redundant, so I've written a generic sb_init function.  I also
>> reorganized sb_isapnp_list.  I raided the ALSA drivers for all the ISAPnP
>> codes for CTL and ESS chips and added them to the table (as I believe Alan
>> suggested). Also returns the 2.3.99pre2 dev->active behavior, which was
>> necessary to detect two of the same type of cards (Alex changed that in
>> his last patch). I cut out some redundant code in probe_sb(), and cleaned
>> up sb_isapnp_init(). Finally, I cleaned up the ISAPnP card detection
>> procedure by dumping the audio device detection procedure and just using
>> card detection (which should be okay since we have all the card ids).  
>> The overall result of this patch is a larger sb_isapnp_list with much less
>> duplicated code - which I believe to be a good trade off. Have a look and
>> please let me know what ya think, how it works for you, and/or if there is
>> something I missed.
>
>That's great !!! sb_card.c was a bloat of nearly identical sb_init_*
>functions...
>
>But the problem is the nearly... Some cards are really broken in
>the sense that irq_resource[0] != dma and irq_resource[1] != dma2...
>For example the ALS007 doesn't have a dma2 but that's
>possible to fix it...
>But in the vanilla sb_card.c from 2.3.99-pre3 you can see that the
>ALS100 has dma = irq_resource[1] and dma2 = irq_resource[0]...
>I really hope this was a typo because this would oblige us to put
>some new members in the struct of isapnp_list...
>
>For the ALS007 the problem is that dma2 is set to 0, which is a valid
>dma. It works for me because I don't have anything using dma 0 but
>it's definitely not a good thing...
>The solution would be to set dma2 to -1 when we are sure it is not
>used but I didn't found an obvious way to do it...
>What I propose is replacing
>
>	hw_config->dma2 = sb_dev->dma_resource[1].start;
>
>by
>
>	if (sb_dev->dma_resource[1].child)
>		hw_config->dma2 = sb_dev->dma_resource[1].start;
>	else
>		hw_config->dma2 = -1;
>
>
>Here I assume that normally dma_resource[1] is the child of dma_resource[0]
>but I can't test it... all my devices have only one irq and one dma.
>So please someone tell me if that portion of code is warranted to pick
>the dma2 in ALL the cards which have one, or if there is a better way
>to do it
>
>
>thanks, gael
>
>
