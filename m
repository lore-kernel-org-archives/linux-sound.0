From: Prasong Aroonruviwat <psa@jesus.ksc.co.th>
Date: Fri, 11 Jun 1999 16:03:05 +0000
Subject: Module vs INTO KERNEL ?
Message-Id: <marc-linux-sound-92911616207004@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Dear All,

        First, I compile sound as a module for a while (ethernet, some fs,
    and almost as a module) but right now, I want to compile all of its that
    I frequently use into kernel.
        All of others is fine except sound :(
        I don't know why, I just change <M> to <*> and specific the IRQ, DMA
    at Sound section of 'make menuconfig'

        There's no /dev/mixer, /dev/dsp nothing except /proc/sound.

--> /proc/sound <--
OSS/Free:3.8s2++-971130
Load type: Driver compiled into kernel
Kernel: Linux jesus 2.2.9-ac5 #3 Fri Jun 11 22:07:35 ICT 1999 i686
Config options: 0

Installed drivers: 
Type 1: OPL-2/OPL-3 FM
Type 26: MPU-401 (UART)
Type 2: Sound Blaster
Type 29: Sound Blaster PnP
Type 7: SB MPU-401

Card config: 
(Sound Blaster at 0x220 irq 5 drq 1,5)
(SB MPU-401 at 0x330 irq 1 drq 0)
(OPL-2/OPL-3 FM at 0x388 drq 0)

Audio devices:

Synth devices:

Midi devices:

Timers:
0: System clock

Mixers:
        
--> /proc/sound <-- WHEN COMPILE AS A MODULE
OSS/Free:3.8s2++-971130
Load type: Driver loaded as a module
Kernel: Linux jesus 2.2.9-ac5 #4 Fri Jun 11 22:38:06 ICT 1999 i686
Config options: 0

Installed drivers: 

Card config: 

Audio devices:
0: Sound Blaster 16 (4.13) (DUPLEX)

Synth devices:

Midi devices:
0: Sound Blaster 16

Timers:
0: System clock

Mixers:
0: Sound Blaster

-- 
4. MOTORCYCLE EMPTINESS ... 6.05
`I talk to God but the sky is empty'
                                        Sylvia Plath
5. YOU LOVE US ... 4.16
`Regard all art critics as useless and dangerous'
                                        Manifesto Of The Futurists
