From: Twinkles <dolphin@gargoyle.apana.org.au>
Date: Fri, 30 Jun 2000 15:49:57 +0000
Subject: SB16 goes all screwy
Message-Id: <marc-linux-sound-96238128011711@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I'm having enormous problems getting the SB16 card to work (Non PNP). I
set up the default settings but always get the following message with 
sound playing for 1/4 second on 10 seconds off.  Even in windows, I am
forced to set the high DMA to the low DMA setting but at least 16-bit
works there - except for 44100Hz.

  Sound: DMA (output) timed out - IRQ/DRQ config error? 

All I have is a standard video card and IO card installed. That's all. I
cannot see what could be conflicting! Sometimes it will just start playing
fine for about 15 minutes and then goes screwy and nothing will fix it
except a reboot. I've scoured the net for days but have no idea. I'm
starting to think I am dumb! ;(

I've tried every IRQ, DMA, IO combination, looked at the cards to confirm
everything and who knows what else.

Any ideas?

Currently /etc/conf.modules is as follows:

alias sound sb
alias midi opl3

options -k sb io=0x220 irq=5 dma=1,5 type=0
options -k sbpcd sbpcd=0x220, Soundblaster
options -k opl3 io=0x388
options -k uart401 io=0x330 irq=5     

Here is /proc/interupts:

 0:    1792597   timer
 1:      42492   keyboard
 2:          0   cascade
 3:    4760734 + serial
 4:     195113 + serial
13:          1   math error
14:     490249 + ide0 

Here is /proc/DMA:

 4: cascade 

Here is lsmod:

Module         Pages    Used by
ppp                5            1 (autoclean)
slhc               2    [ppp]   1 (autoclean)
uart401            2            0
sound             17    [uart401]       0 (autoclean)
autofs             3            1 (autoclean)
nfs               13            5 (autoclean)
vfat               4            1 (autoclean)
fat                6    [vfat]  1 (autoclean) 
