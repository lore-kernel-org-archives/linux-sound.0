From: Gerald Teschl <gerald.teschl@univie.ac.at>
Date: Mon, 03 Jun 2002 18:47:53 +0000
Subject: Re: isapnp problems with opl3sa2
Message-Id: <marc-linux-sound-102313010816380@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-102310582924862@msgid-missing>
In-Reply-To: <marc-linux-sound-102310582924862@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Zwane Mwaikambo wrote:

>You should be able to load it without any parameters with ISAPNP, i have a 
>box at home with that card which only requires a modprobe opl3sa2. Could 
>you show me how you're loading it as well as dmesg and /proc/isapnp output 
>after loading.
>
I use redhat-7.3 (kernel-2.4.18-4) and this is an ASUS L7300 laptop.
In /etc/modules.conf I have

alias sound-slot-0 opl3sa2
options sound dmabuf=1
alias synth0 opl3
options opl3 io=0x388
options opl3sa2 ymode=2 isapnp=1

and /proc/isapnp looks like
-------------------------------------------------
Card 1 'YMH0800:YAMAHA OPL3-SAx Audio System' PnP version 1.0
  Logical device 0 'YMH0021:Unknown'
    Device is not active
    Active DMA 0,0
    Resources 0
      Priority preferred
      Port 0x220-0x220, align 0xf, size 0x10, 16-bit address decoding
      Port 0x530-0x530, align 0x7, size 0x8, 16-bit address decoding
      Port 0x388-0x388, align 0x7, size 0x8, 16-bit address decoding
      Port 0x330-0x330, align 0x1, size 0x2, 16-bit address decoding
      Port 0x370-0x370, align 0x1, size 0x2, 16-bit address decoding
      IRQ 5 High-Edge
      DMA 0 8-bit byte-count type-A
      DMA 1 8-bit byte-count type-A
      Alternate resources 0:1
      ...........
---------------------------------------------
before inserting the module. If I insert the (original) module using 
"modporbe opl3sa2" dmesg read:

ad1848/cs4248 codec driver Copyright (C) by Hannu Savolainen 1993-1996
ad1848: No ISAPnP cards found, trying standard ones...
opl3sa2: ISA PnP activate failed
opl3sa2: No PnP cards found
opl3sa2: 0 PnP card(s) found.

and /proc/isapnp looks as before. My investigations showed that the 
error occures in
isapnp_valid_dma() invoked from isapnp_config_activate() in isapnp.c.

If I insert my patched module I get

opl3sa2: Activated ISA PnP card 0 (active=1)
opl3sa2: chipset version = 0x4
opl3sa2: Found OPL3-SA3 (YMF715E or YMF719E)
ad1848: Interrupt test failed (IRQ5)
opl3sa2: 1 PnP card(s) found.

and /proc/isapnp looks like
-------------------------------------------
Card 1 'YMH0800:YAMAHA OPL3-SAx Audio System' PnP version 1.0
  Logical device 0 'YMH0021:Unknown'
    Device is active
    Active port 0x220,0x530,0x388,0x330,0x370
    Active IRQ 5 [0x2]
    Active DMA 0,1
    Resources 0
    .................
-------------------------------------------

>
>
>>A few further remarks concerning my patch:
>>*) The patch also adds a line "opl3sa2_state[card].activated = 1" which 
>>is an obvious omission in the original driver.
>>
>
>Thanks, put it right at the end before the return and i'll be happy.
>
Yes, you are right, probably more readable.

>
>
>>*) I have to force the driver to use both dma=0 and dma2=1. From what I
>>understand dma=0 should be sufficient, but this will not work. Looks like
>>a bug in isapnp.c to me. However, this should do no harm since according
>>to /proc/isapnp, the card only offers these values anyway.
>>
>
>isapnp.c is fine
>
I still think this might affect other hardware as well. Does your card 
use the same
irq/prot/dma settings? Does your /proc/isapnp look the same as mine? I don't
quite understand why it works for you. 

>When you rediff, can you diff so that the patch can be applied with a 
>strip of '1' ie diff -u linux/drivers...
>
No problem.

Thanks for your help!

Gerald

