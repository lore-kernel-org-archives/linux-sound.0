From: Gerald Teschl <gerald.teschl@univie.ac.at>
Date: Fri, 07 Jun 2002 07:54:50 +0000
Subject: Re: [PATCH] unregister YMH0021 from ad1848
Message-Id: <marc-linux-sound-102343653810847@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-102339013507846@msgid-missing>
In-Reply-To: <marc-linux-sound-102339013507846@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Zwane Mwaikambo wrote:

>Hi Gerald,
>  
>
>I don't have it uncommented, this is what i get;
>
>ad1848/cs4248 codec driver Copyright (C) by Hannu Savolainen 1993-1996
>ad1848: OPL3-SA2 WSS mode detected
>ad1848: ISAPnP reports 'OPL3-SA2 WSS mode' at i/o 0xe80, irq 5, dma 1, 3
>opl3sa2: chipset version = 0x3
>opl3sa2: Found OPL3-SA3 (YMF715B or YMF719B)
><OPL3-SA3> at 0x100 irq 5 dma 1,3
><MS Sound System (CS4231)> at 0xe84 irq 5 dma 1,3
><MPU-401 0.0  Midi interface #1> at 0x300 irq 5
>opl3sa2: 1 PnP card(s) found.
>
>Did you try a more recent -ac kernel? Because i sent a patch for this 
>about 2 months back.
>
>  
>
This is a kernel which has your patch included. Otherwise it will say
"ad1848: No ISAPnP card(s) found";-) BTW, everything seems to work
fine even without your patch.

Even with your patch, if I just load the ad1848 module (which is what 
sndconfig
will set up for you -- you can find several users reporting this problem 
if you search
the mailing lists) sound will not work! So if I understand this 
correctly, this implies
that the YMH0021 entry should be removed from the MODULE_DEVICE_TABLE
in ad1848 since it is not a driver for this device.

Gerald


