From: Paul Laufer <pelaufer@csupomona.edu>
Date: Fri, 14 Sep 2001 04:57:05 +0000
Subject: Re: SB16: Bad or missing 16 bit DMA channel
Message-Id: <marc-linux-sound-100044350306654@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-99988458525824@msgid-missing>
In-Reply-To: <marc-linux-sound-99988458525824@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Fri, Sep 07, 2001 at 10:39:41AM -0700 or thereabouts, otisg@ivillage.com wrote:
> Hello,
> 
> I have a SB sound card, model CT4170 plugged into an ISA slot of a Epox mother board, model EP-MVP3G5.
> 
> Every hour or so I see this in /var/log/messages:
> 
> modprobe: modprobe: Can't locate module sound-service-0-0
> kernel: Soundblaster audio driver Copyright (C) by Hannu Savolainen 1993-1996
> kernel: sb: Creative ViBRA16X PnP detected
> kernel: sb: ISAPnP reports 'Creative ViBRA16X PnP' at i/o 0x220, irq 5, dma 1, 3
> kernel: SB 4.16 detected OK (220)
> kernel: SB16: Bad or missing 16 bit DMA channel
> kernel: sb: 1 Soundblaster PnP card(s) found.

Chances are the module is automatically unloaded after a time of non use
and then re-loaded automatically by kmod when something tries to access
/dev/dsp.

sound-service-0-0 is /dev/mixer. The same program that is accessing
/dev/dsp causing the driver to re-load is probably the same one
accessing /dev/mixer and causing the sound-servic-0-0 message. If you
want these messages to go away, in /etc/modules.conf you can enter a
line 'alias sound-service-0-0 off' or 'alias sound-services-0-0 sb' to
have it auto-load the module.
 
> I'm wondering why the kernel needs sound-service-0-0 module, which fails to load, when my sound works just fine without it, apparently?
>
> I am also wondering what is causing "SB16: Bad or missing 16 bit DMA channel" warnings?

Here's the deal. The ViBRA16X is unlike any other Creative Soundblaster
card in that it requires two 8 bit DMA instead of one 8 bit and one 16
bit dma. It also handles full duplex operation differently than any
other soundblaster card. Nobody has taken the time to make it work
properly. The message is a result of the soundblaster driver expecting
the second DMA to be 16 bit when in fact for this card an 8 bit DMA is
used. Don't worry about it, your card will still playback or record just
fine. It just wont do both at once.

> This is what I have in /etc/modules.conf:
> 
> alias sound-slot-0 sb 
> post-install sound-slot-0 /bin/aumix-minimal -f /etc/.aumixrc -L >/dev/null 2>&1 || : 
> pre-remove sound-slot-0 /bin/aumix-minimal -f /etc/.aumixrc -S >/dev/null 2>&1 || :
> 
> Should I remove or change this?

No need to remove this. It simply causes the mixer settings in
/etc/.aumixrc to be loaded after the sound driver is loaded.

> I can't remember why I put this in modules.conf nor what it does, any more. :(
> 
> Thanks,
> Otis
> 
> _________________________________________________________________
> iVillage.com: Solutions for Your Life 
> Check out the most exciting women's community on the Web   
> http://www.ivillage.com
> -
> To unsubscribe from this list: send the line "unsubscribe linux-sound" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
