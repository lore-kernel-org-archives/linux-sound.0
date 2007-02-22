From: bytewise@gmx.net
Date: Thu, 22 Feb 2007 11:26:11 +0000
Subject: 2.6.20: volume very low after acpi suspend/resume (s4)
Message-Id: <1172143571.14647.1175937705@webmail.messagingengine.com>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi,

I don't know whether this should go here or to the kernel list. Please
tell me if I'm correct or not.

On a vanilla 2.6.20 kernel, the sound volume level is extremely low
after a suspend / resume cycle (suspend to disk, s4). The volume is so
low that I can't even correct it by turning up my external amplifier. I
use alsa (no sound server) and have a built in Intel 82801DB/DBL/DBM
sound card as far as I can tell (see lspci below). As a result, suspend
to disk is unusable on this computer, because it is used to play music
most of the time.

Unloading *and* reloading sound related modules *after* resuming doesn't
help, the volume stays down. Unloading (before suspending) and reloading
(after resuming) doesn't help either. Does this mean that this is caused
not by sound modules but some other part than the kernel? If so, which
part messes with volume?

If I do a suspend/resume cycle with 2.6.19(.2), there is no change in
volume at all, so the problem is probably not caused by the gnome mixer.

Some system information:

2.6.20:
lsmod | grep snd
snd_intel8x0           32668  1
snd_pcm_oss            43040  0
snd_mixer_oss          16640  1 snd_pcm_oss
snd_intel8x0m          17356  0
snd_ac97_codec         93920  2 snd_intel8x0,snd_intel8x0m
ac97_bus                2240  1 snd_ac97_codec
snd_pcm                75592  4
snd_intel8x0,snd_pcm_oss,snd_intel8x0m,snd_ac97_codec
snd_timer              21444  1 snd_pcm
snd                    50468  9
snd_intel8x0,snd_pcm_oss,snd_mixer_oss,snd_intel8x0m,snd_ac97_codec,snd_pcm,snd_timer
soundcore               7520  1 snd
snd_page_alloc          9992  3 snd_intel8x0,snd_intel8x0m,snd_pcm

2.6.19.2:
snd_intel8x0m          17356  0
snd_pcm_oss            42720  0
snd_mixer_oss          16576  1 snd_pcm_oss
snd_intel8x0           32668  1
snd_ac97_codec         93792  2 snd_intel8x0m,snd_intel8x0
snd_ac97_bus            2240  1 snd_ac97_codec
snd_pcm                75656  4
snd_intel8x0m,snd_pcm_oss,snd_intel8x0,snd_ac97_codec
snd_timer              21508  1 snd_pcm
snd                    50724  9
snd_intel8x0m,snd_pcm_oss,snd_mixer_oss,snd_intel8x0,snd_ac97_codec,snd_pcm,snd_timer
soundcore               7584  1 snd
snd_page_alloc          9992  3 snd_intel8x0m,snd_intel8x0,snd_pcm


lspci:

Multimedia audio controller: Intel Corporation 82801DB/DBL/DBM
(ICH4/ICH4-L/ICH4-M) AC'97 Audio Controller (rev 03)
Subsystem: Acer Incorporated [ALI] Unknown device 001f
Control: I/O+ Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr-
Stepping- SERR- FastB2B-
Status: Cap+ 66MHz- UDF- FastB2B+ ParErr- DEVSEL=medium >TAbort-
<TAbort- <MAbort- >SERR- <PERR-
Latency: 0
Interrupt: pin B routed to IRQ 10
Region 0: I/O ports at 1c00 [size%6]
Region 1: I/O ports at 18c0 [sized]
Region 2: Memory at d0000c00 (32-bit, non-prefetchable) [sizeQ2]
Region 3: Memory at d0000800 (32-bit, non-prefetchable) [size%6]
Capabilities: [50] Power Management version 2
Flags: PMEClk- DSI- D1- D2- AuxCurrent75mA
PME(D0+,D1-,D2-,D3hot+,D3cold+)
Status: D0 PME-Enable- DSel=0 DScale=0 PME-


Regards,
Robert
