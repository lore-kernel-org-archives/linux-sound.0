From: "Soulier, Frederic" <Frederic.P.Soulier@british-airways.com>
Date: Wed, 02 Jun 1999 09:26:38 +0000
Subject: AWE64 ISA PnP - Midi Sound
Message-Id: <marc-linux-sound-92831664525060@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi,

I am running Linux SuSE 6.1 (kernel 2.2.5) and I got my SB AWE64 ISA PnP
to work reasonnably well (eg .wav files) but I have some pbms with
Midi files (.mid).
The AWE64 has already a Midi Sound bank in ROM and without loading
any new sound banks via 'sfxload' I suppose I should be able to play
Midi files without troubles.
I have tried a whole bunch of different Midi files under W95 and they
play just fine. When I try the same ones with kmidi (KDE desktop)
I get no sound at all. (not entirely true, there is one midi file
that plays ok except that it misses instruments. I found that by
comparing with what I was hearing under W95).

Loading the sound bank 'synthgm.sbk' with 'sfxload' does not improve
anything...

What can be wrong?

/etc/conf.modules
alias char-major-14 sb
alias midi awe_wave
post_install sb /sbin/modprobe "-k" "adlib_card"
post_install awe_wave /usr/local/bin/sfxload /usr/local/lib/sfbank/synthgm.sbk
options sb io=0x220 irq=7 dma=1 dma15=5 mpu_io=0x330
options adlib_card io=0x388

once booted, lsmod does not show any sound modules loaded but when
I launch kmidi (under KDE) then the following modules are loaded:
   - adlib_card
   - opl3
   - sb
   - uart401
   - sound
   - soundlow
   - soundcore

the "awe_wave" module does not get loaded I have to
"modprobe -k awe_wave" to load it (although with or without this module
it does not make any difference...)

Also is there any software able to play all .mid, .au, .wav and .mod files?

Any help more than welcome!

Ciao
Fred
