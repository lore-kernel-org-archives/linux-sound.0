From: Steve Crowder <fe88@dial.pipex.com>
Date: Sat, 26 Feb 2000 11:51:12 +0000
Subject: Re: SB64 AWE Mixer _broken_!
Message-Id: <marc-linux-sound-95156616901890@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95136953017709@msgid-missing>
In-Reply-To: <marc-linux-sound-95136953017709@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


Thus spake Christian Robottom Reis:

>
>(Sorry for the direct CCing - didn't know if this was relevant or not and
>I've been asking around for weeks - just 'D' it away if it annoys you)
>
>My AWE is acting up on a vanilla 2.2.14 build. I'm configuring it via
>isapnp and using modules loaded via kmod & modules.conf. It's detected as
>an SB 4.16 - and it plays fine for normal playback (average midi and dsp
>usage).
>

>I am not loading the awe_wave module, and I don't think it matters much.
To use the wavetable you need to load this module - see the two extra lines 
for isapnp.conf below

>
>If I change volume on this card _while it's playing_, however, I get
>broken sound, DMA timeouts and general crap out of the speakers. This only
>happens if I touch the mixer - if I don't, it's all fine. I can twiddle
>with the volume a bit to get the sound to come out unbroken again.
>
>What problem could this be a symptom of?
>
>It's a CT4380 - anybody have a similar card?
>
>Forget the rest if this is an obviously known problem.
>
>I can downgrade the kernel to test if it seems like the proper thing to do
>- has anyone been testing this card lately?
>
>On an unrelated note - is it proper that I (ACT Y) the card during isapnp?
>
>-- relevant modules.conf
>
>alias sound sb

>options sound dmabuf=1
Change this to - pre-install sound /sbin/insmod sound dmabuf=1

>options sb io=0x220 irq=5 dma=1 dma16=5 mpu_io=0x330
>alias midi opl3
>options opl3 io=0x388
>alias sbawe awe_wave
>options awe_wave io=0x620
>
>alias sound-slot-0 sb
>alias sound-service-0-0 sb
>alias sound-service-0-3 sb
>
>alias char-major-14 sb
>
>-- relevant isapnp.conf
>
># (DEBUG)
>#(READPORT 0x0273)
>(ISOLATE PRESERVE)
>(IDENTIFY *)
>(VERIFYLD N)
>(VERBOSITY 2)
>(CONFLICT (IO FATAL)(IRQ FATAL)(DMA FATAL)(MEM FATAL)) # or WARNING
>
>(CONFIGURE CTL00c1/523545677 (LD 0
> (INT 0 (IRQ 5 (MODE +E)))
> (DMA 0 (CHANNEL 1))
> (DMA 1 (CHANNEL 5))
> (IO 0 (SIZE 16) (BASE 0x0220))
> (IO 1 (SIZE 2) (BASE 0x0330))
> (IO 2 (SIZE 4) (BASE 0x0388))
> (NAME "CTL00c1/523545677[0]{Audio               }")
> (ACT Y)
>))
>
>(CONFIGURE CTL00c1/523545677 (LD 1
> (IO 0 (SIZE 8) (BASE 0x0200))
> (NAME "CTL00c1/523545677[1]{Game                }")
> (ACT Y)
>))
>
>(CONFIGURE CTL00c1/523545677 (LD 2
> (IO 0 (SIZE 4) (BASE 0x0620))

Add these 2 lines manually -
 (IO 1 (SIZE 4) (BASE 0x0A20))
 (IO 2 (SIZE 4) (BASE 0x0E20))

> (NAME "CTL00c1/523545677[2]{WaveTable           }")
> (ACT Y)
>))
>
>(WAITFORKEY)
>
>Cheers,

Check out http://www.fe88.dial.pipex.com/awe64config.shtml for more info.
>--
>_/\ Christian Reis is sometimes kiko@radiumsystems.com.br 
>\/~ suicide architect | free software advocate | mountain biker 

-- 
Steve Crowder 
SMP Linux 2.3.5ac1 RedHat 6.0
Email: fe88@dial.pipex.com
WWW: http://www.fe88.dial.pipex.com/
