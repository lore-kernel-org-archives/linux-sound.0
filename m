From: Michael Haller <mhaller@acm.org>
Date: Mon, 14 Dec 1998 04:38:11 +0000
Subject: Re: help needed for cs423x chips
MIME-Version: 1
Content-Type: multipart/mixed; boundary="------------EA6F6F60FE4DEF0DB42BFC76"
Message-Id: <marc-linux-sound-91361053406131@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91325015828495@msgid-missing>
In-Reply-To: <marc-linux-sound-91325015828495@msgid-missing>
To: linux-sound@vger.kernel.org

This is a multi-part message in MIME format.
--------------EA6F6F60FE4DEF0DB42BFC76
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

> On Sat, 12 Dec 1998, Tony Nugent wrote:
> 
> > options -k cs4232 io=0x530 dma=1 dma2=0 irq=5
> > # no midi yet :(
> >
> > This works for the audio driver, but I have yet to get the midi to work.
> options cs4232 io=0x530 irq=7 dma=1 dma2=0 mpuirq=9 mpuio=0x330
>
> <Crystal audio controller (CS4236)> at 0x530 irq 7 dma 1,0
> <MPU-401 (UART) MIDI> at 0x330 irq 9
>
> ps anyone know how to get the sequencer working on these things?

Audio support of the CS4235 with the existing CS4232 driver will not
work because the 4235 does not support ulaw, alaw or adpcm.  sequencer
support probably doesn't work for any of the crystal chips because of a
code ordering problem in cs4232.c.   I'm attaching a patch file for
2.1.131 which fixes these problems on my CS4235.

As Tony and Keith point out, all the settings must be correct.  I use:

modprobe cs4232 io=0x530 irq=5 dma=0 dma2=1 mpuio=0x330 mpuirq=9
modprobe opl3 io=0x388

Let me know how this works.

Mike Haller
--------------EA6F6F60FE4DEF0DB42BFC76
Content-Type: application/x-gzip;
 name="patch-cs4235.gz"
Content-Transfer-Encoding: base64
Content-Disposition: inline;
 filename="patch-cs4235.gz"

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
--------------EA6F6F60FE4DEF0DB42BFC76--
