From: Zwane Mwaikambo <zwane@linux.realnet.co.sz>
Date: Fri, 07 Jun 2002 06:09:58 +0000
Subject: Re: [PATCH] unregister YMH0021 from ad1848
Message-Id: <marc-linux-sound-102343196907884@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-102339013507846@msgid-missing>
In-Reply-To: <marc-linux-sound-102339013507846@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi Gerald,

On Thu, 6 Jun 2002, Gerald Teschl wrote:

> Since the main driver for opl3sax cards (YMH0021) is opl3sa2
> I have commented the YMH0021 entry in the MODULE_DEVICE_TABLE
> in ad1848.c. Otherwise both ad1848 and opl3sa2 will be listed
> in modules.isapnpmap and tools like sndconfig will setup the
> card using ad1848 instead of opl3sa2.

Can't say i've come across that one before.

> I have tested this and it causes no problems (this is the output
> when using all patches together):
> 
> isapnp: Scanning for PnP cards...
> isapnp: opl3sa4 quirk: Allowing dma 0.
> isapnp: Card 'YAMAHA OPL3-SAx Audio System'
> isapnp: 1 Plug & Play card detected total
> ad1848/cs4248 codec driver Copyright (C) by Hannu Savolainen 1993-1996
> ad1848: OPL3-SA2 WSS mode detected
> ad1848: ISAPnP reports 'OPL3-SA2 WSS mode' at i/o 0x530, irq 5, dma 0, 1
> opl3sa2: chipset version = 0x4
> opl3sa2: Found OPL3-SA3 (YMF715E or YMF719E)
> opl3sa2: 1 PnP card(s) found.

I don't have it uncommented, this is what i get;

ad1848/cs4248 codec driver Copyright (C) by Hannu Savolainen 1993-1996
ad1848: OPL3-SA2 WSS mode detected
ad1848: ISAPnP reports 'OPL3-SA2 WSS mode' at i/o 0xe80, irq 5, dma 1, 3
opl3sa2: chipset version = 0x3
opl3sa2: Found OPL3-SA3 (YMF715B or YMF719B)
<OPL3-SA3> at 0x100 irq 5 dma 1,3
<MS Sound System (CS4231)> at 0xe84 irq 5 dma 1,3
<MPU-401 0.0  Midi interface #1> at 0x300 irq 5
opl3sa2: 1 PnP card(s) found.

Did you try a more recent -ac kernel? Because i sent a patch for this 
about 2 months back.

-- 
http://function.linuxpower.ca


