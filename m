From: Wima Sangga Yudanto <wima@telkom.net>
Date: Wed, 24 Feb 1999 23:47:53 +0000
Subject: Re: Yamaha OPL3-Sax sound card
Message-Id: <marc-linux-sound-91990724818355@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91989263906824@msgid-missing>
In-Reply-To: <marc-linux-sound-91989263906824@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I use 2.0.36 kernel on my satellite 2500cds, its works fine. And i use it
too on my desktop with opl3-sax.

Don't configure it as SB, it will not working properly, but configure as
MSS/WSS will do much better.

if pnpdump don't recognize your sc, try to force it. 
boot your system in DOS and run your sc configuration, write down the io,
irq, dma, etc. and then instal the modules.

On Wed, 24 Feb 1999, Ramon Nieto wrote:

> i have a Yamaha OPL3-SAx sound card on a toshiba satellite 2500cds. 
> i instaled linux red hat 5.1 and i know this can't recognize the sound
> card i tried to configure it as a sound blaster but it only play in 8
> bits mode, the sound card support 16 bit mode.
> 
> BTW the isapnptools don't recognize the sound card as a PnP card.


Wima Sangga Y.
--------------
Engineering Physics - ITS
