From: Emil Stephan <ste@esqhen.su.eunet.de>
Date: Mon, 28 Sep 1998 20:15:42 +0000
Subject: Re: AWE32 initialization wiht isapnp
Message-Id: <marc-linux-sound-90703830506277@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90692428831897@msgid-missing>
In-Reply-To: <marc-linux-sound-90692428831897@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Ricardo Peres wrote:
> 
> Hi!
> 
> By the way, how do I enable the midi device?
> I have a SB 32 Plug & Play, and it is working fine, except for the midi.
> My /dev/sndstat file is as follows:
> 
> -----Begin------
> 
> Sound Driver:3.5.4-960630
> Kernel: Linux replicant.dei.uc.pt 2.0.35 #1 Thu Sep 24 21:11:57 WEST 1998
> i586
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
> 0: Yamaha OPL-3
> 1: AWE32-0.4.2d (RAM0k)
> 
> Midi devices:
> 
> Timers:
> 0: System clock
> 
> Mixers:
> 0: Sound Blaster
> 1: AWE32 Equalizer
> 
> -------End-------
> 
> I have kernel 2.0.35 compiled with midi support (as you can see).
> 
> Thanks!
> ...

Hello,
On my 2.0.33 system the midi devices get recognized,
but no bytes are leaving the sound card via the midi bus.
I have an AWE 64 Gold here.
Does anybody know of such problems with AWE cards or has anybody midi
output
to externals synths running under Linux ?

The output of /dev/sndstat here is the following:
-------------------------
---OSS/Free3.8s9-980302 (Thu Aug 27 21:36:00 CEST 1998 root,
Linux esqhen 2.0.33 #6 Tue May 5 21:52:30 CEST 1998 i586 unknown)
Load type: Driver loaded as a module.
Kernel: Linux esqhen 2.0.33 #6 Tue May 5 21:52:30 CEST 1998 i586
Config options: 0

Installed drivers: 
Type 26: MPU-401 (UART)
Type 2: Sound Blaster
Type 29: Sound Blaster PnP
Type 7: SB MPU-401

Card config: 
Sound Blaster at 0x220 irq 5 drq 1,5
SB MPU-401 at 0x330 irq 5 drq 0

Audio devices:
0: Sound Blaster 16 (4.16)

Synth devices:
0: AWE32-0.4.2d (RAM4096k)

Midi devices:
0: Sound Blaster 16

Timers:
0: System clock

Mixers:
0: Sound Blaster
1: AWE32 Equalizer
------------------------------

Bye, Emil.

-- 
--------------------------------------------------
Emil Stephan, Marktplatz 39, 53773 Hennef, Germany
voice: +49-2242-84438

Accelerate Windows: 9.81 m/sec^2 would be adequate
