From: Rodrigo Castro <rodsc@bigfoot.com>
Date: Tue, 16 Feb 1999 14:35:13 +0000
Subject: mp3's not playing?
Message-Id: <marc-linux-sound-91917200724718@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91917509627068@msgid-missing>
In-Reply-To: <marc-linux-sound-91917509627068@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
To: linux-sound@vger.kernel.org

I have exactly the same problem as this guy. In my case, I have a SB32 PnP.

Any idea?

P.S.: I put a SB16 non-PnP to test and it worked really fine. I guess the
problem is in PnP, am I right?

Well, that's it
Rodrigo Castro <rodsc@bigfoot.com>
Computer Science undergraduate student at University of S=E3o Paulo

Scott Olsson - scohop wrote:

> I have a soundblaster 16 plug and play card that has been giving me the
> fits. I've tried everything (well, almost... everything except what will
> eventually work...) to no avail. Below, I outlined how I've been going
> at this... if you have a similar card, please correct whatever ignorant
> greenie mistake I'm surely making/looking over... thanks!!
>
> I boot, isapnp loads and says it's configuring the card for dma's 1,5
> and irq5... then, I load the following modules as such...
> ----
> /sbin/insmod soundcore
> /sbin/insmod sound
> /sbin/insmod uart401
> /sbin/insmod sb io=3D0x220 irq=3D5 dma=3D1 mpu_io=3D0x330
> /sbin/insmod opl3 io=3D0x388
> ---
> Below, I cat'd my /dev/sndstat for reference... I don't really
> understand how some of it applies, but I'm assuming something
> should be listed under "installed drivers"... (???)
> ----
>
> OSS/Free:3.8s2++-971130
> Load type: Driver loaded as a module
> Kernel: Linux .csh.uiuc.edu 2.2.1 #13 Mon Feb 15 15:09:11 EST 1999 i686
> Config options: 0
>
> Installed drivers:
>
> Card config:
>
> Audio devices:
> 0: Sound Blaster 16 (4.13)
>
> Synth devices:
> 0: Yamaha OPL3
>
> Midi devices:
> 0: Sound Blaster 16
>
> Timers:
> 0: System clock
>
> Mixers:
> 0: Sound Blaster
>
> ----
>
> After the modules are all (??) loaded, I cat an au file to /dev/dsp or
> /dev/audio and it will play fine, but mp3's will not play
> through any of the players I have tried... (x11amp, freeamp, amp,
> xaudio, mpg123, newplayer)
>
> when I've tried with an mp3player like newplayer it complains about dma
> problems with the following error message...
>
> Sound: DMA (output) timed out - IRQ/DRQ config error?
>
> Is there a specific procedure or some other driver/module that needs to
> be configured and/or loaded before mp3's/wav's will play? Also, where
> (script, etc) can I add the modules to load them every boot?
>
> Any help will be very VERY... umm, helpful?
> THANKS!!!
>
> scott olsson
>
> -- please email your response as welll... thanks again.
>
> --
> Scott Olsson - scohop
> olsson@uiuc.edu
