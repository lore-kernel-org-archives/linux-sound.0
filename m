From: OHPC <ohpc@mii.zaz.com.br>
Date: Sun, 09 Jan 2000 17:33:12 +0000
Subject: PCI 512 - more questions
Message-Id: <marc-linux-sound-94744194011563@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


> > Yes, the SB Live drivers will work - I have one, and it worked. You 
> need to
> > download and compile the drivers from the creative page. I talked to them,
> > and even them will say they don't know if it will work...
> > But I managed to put mine to work.
> >
> > Get the drivers from http://www.opensource.creative.com.
> >
> > Modify your conf.modules like this:
> >
> > alias sound emu10k1
> > options emu10k1 joystick=0x200
> >
> > Then:
> > "make depend"
> > "make clean"
> > "make"
> > "make install".
> >
> > Run:
> > "depmod -a"
> > "insmod soundcore"
> > "modprobe emu10k1".
> >
> > More details? Go to this site:
> > http://www.euronet.nl/~mailme/index3.html
> >
>
>Okay... you seem to really know what you are doing, so I want to verify
>that I have done everything correctly.  (Using SuSE 6.3 distribution)
>
>(a)     complied new kernel with built-in sound support,
>         but no OSS support
>
>(b)     added these two lines to /etc/modules.conf
>                 alias sound emu10k1
>                 options emu10k1 joystick=0x200
>
>(c)     compiled the emu10k1 drivers as you described
>
>(d)     added "modprobe sound" to me /etc/rc.d/boot.local
>
>This gives me the following output when I do "cat /dev/sndstat"
>
>OSS/Free:3.8s2++-971130
>Load type: Driver loaded as a module
>Kernel: Linux forbin 2.2.13 #5 Sat Jan 8 05:44:03 PST 2000 i686
>Config options: 0
>
>Installed drivers:
>Type 0: Creative EMU10K1 (0.4)
>
>Card config:
>(Sound Blaster Live! at 0xcc00 irq 9)
>
>Audio devices:
>0: Sound Blaster Live! (DUPLEX)
>
>Synth devices:
>Not supported by current driver
>
>Midi devices:
>0: Sound Blaster Live!
>
>Timers:
>0: System Clock
>
>Mixers:
>0: Sound Blaster Live!
>
>
>Does this all look and sound correct to you?  I ask, because the audio
>applications that I have written using the OSS API no longer function
>correctly.

Well, everything seems to be working, but I don't have much experience, 
since I am a newbie to it. I use RedHat, but my SB Live won't  work with 
X11Amp, only working with XMMS when playing MP3 - strange, to say the 
least. Some MIDI files I have also didn't play correctly, but that I 
suppose is because of the samples are used by the MIDI player (I suspect 
not all samples are available in my version of the MIDI player).

Have you tried posting your message to linux-newbie? If you list the 
messages you get when "cat /dev/sndstat", I am sure they will able to tell 
you if this means your board is really working.
Anyway, I don't know of OSS API, since my sugestion to post in the linux 
newbie list, because they may be of great help.

Good luck. I wish I might have helped you more
