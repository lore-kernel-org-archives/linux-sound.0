From: Simon J Mudd <sjmudd@pobox.com>
Date: Tue, 10 Jun 2003 09:25:03 +0000
Subject: Re: Help configuring a CS4236 to work with Linux
Message-Id: <marc-linux-sound-105523713006960@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-105519659910416@msgid-missing>
In-Reply-To: <marc-linux-sound-105519659910416@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hello Michael,

On Mon, 9 Jun 2003, rautenkranzmt wrote:

> Having reviewed your settings incl., i wonder, with the pnpdump... does 
> your system run isapnp at start? and have you edited /etc/isapnp.conf to 
> reflect any settings at all for your sound card? red hat's sndconfig 
> does it automatically, and chooses it's own settings (in my experience), 
> but i've never seen it apply isapnp settings to the conf file.

Initially I didn't do anything (didn't add anything to /etc/modules.conf),
didn't have /etc/isapnp.conf, or have isapnptools on my machine) and let
RedHat's sndconfig "do it's stuff".

Running sndconfig gave me:
Model: Crystal codec: GAME
Can you hear the sample sound? I could so I typed yes. sndconfig modified
/etc/modules.conf adding:

alias sound-slot-0 cs4232
post-install sound-slot-0 /bin/aumix-minimal -f /etc/.aumixrc -L >/dev/null 2>&1 || :
pre-remove   sound-slot-0 /bin/aumix-minimal -f /etc/.aumixrc -S >/dev/null 2>&1 || :
options sound dmabuf=1
alias synth0 opl3
options opl3 io=0x330
options cs4232 isapnp=1

Running the mpg321 somefile.mp3 _hung_ the machine.

I tried again, setting the values by hand, being able to choose options:

I/O Port IRQ DMA 1 DMA 2 MPU I/O MPU IRQ
0x530    5   0     0     0x330   5
0x534    7   1     1     0x300   7

Selecting 0x534,5,1,1,0x330,7

(note: IRQ 5 is being used by usb-ohci and I wasn't able to select IRQ 9
where /proc/interrupts tells me the cs4232 is "listening").

This didn't seem to work either, so I started looking around on the web
for "help", downloaded isapnptools from source and tried setting the
options by hand.

To be honest I don't really understand the isapnp.conf config file very
well, nor am I sure what I need to configure exactly, so I may well be
doing something obviously wrong.

To play "mp3 audio" I think I don't need to have the mpu401 configured,
and as I mentioned before while the IRQ and I/O port settings seem clear
to me (IRQ 9 and 0x534 appears to be what the card wants) I'm unsure about
the dma1 and dma2 settings.

> this corresponds exactly to the kind of trouble i was having a couple 
> years back with my opl-sa3 pnp card. i edited isapnp.conf (see 'man 
> isapnp.conf'), and had it load in rc.local. my problem was fixed.

Perhaps the problem is that I am unable to correctly interpret the
/proc/isapnp values to enable me to configure the card correctly.

Thanks for any insight you can give me.

Simon
-- 
Simon J Mudd, Postfix RPM Packager, Amsterdam, The Netherlands.
email: sjmudd@pobox.com, Tel: +31-627-592 627, http://postfix.WL0.org


