From: "moc liamtoh" <mackilla@hotmail.com>
Date: Mon, 18 Jan 1999 12:05:26 +0000
Subject: Re: Crystal CS4235 with 2.2.0-pre7
Message-Id: <marc-linux-sound-91669060300940@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

i have the same chip (aopen MB) and i had problems too, (i use the 
2.0.36) but i got it to werk by swapping the dma's so that i had 534, 
irq 5, dma=1 and dma2=0 and that, oddly enough, seemed to work...and not 
that bad either...altough i have on board video also and when i was 
trying to use that it would get very bad sound....

regards,

Josh


<SNIP>
>Hi,
>
>Alan Cox stated a few weeks ago that there is support for the Crystal
>soundchip CS4235 in kernel 2.1.132ac1. I have an Acer motherboard with 
>this chip and so decided to make the latest available kernel
>linux-2.2.0-pre7.
>
>I found no references to CS4235 and so took the closest config option
>CS4232. 
>
>Unfortunately 
>
>cat /usr/lib/xemacs-20.4/etc/sounds/im_so_happy.au > /dev/audio
>
>simply gave silence.
>
>I would be very glad if someone out there could give me advice.
>
>Kind regards
>
>Gerd
>
>Here are the details:
>
>To avoid module trouble I made a kernel with builtin support for
>CS4232. These are my defines:
>
>CONFIG_SOUND_CS4232=y
>CONFIG_CS4232_BASES4
>CONFIG_CS4232_IRQ=5
>CONFIG_CS4232_DMA=0
>CONFIG_CS4232_DMA2=1
>CONFIG_CS4232_MPU_BASE:8
>CONFIG_CS4232_MPU_IRQ=9
>
<SNIP>

______________________________________________________
Get Your Private, Free Email at http://www.hotmail.com
