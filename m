From: Sergey <sergey@7ka.mipt.ru>
Date: Mon, 01 May 2000 15:31:47 +0000
Subject: The GUS MAX troubles
Message-Id: <marc-linux-sound-95719605500251@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I have such a problem:
A Gravis Ultrasound (MAX 2.1) card + RH Linux 6.1 (2.2.12-20)
I load the drivers as described in
/usr/src/linux/Documentation/ultrasound:
modprobe sound
insmod ad1848
insmod gus io=0x220 irq dma=1 gus16=1 type=0 dma16=5  

so I get normally working devices: 
the PCM playback/record (/dev/dsp) 
 /dev/dsp1 (2nd playback/record)
  and
/dev/mixer
/dev/mixer1 (looks like second mixer)
and some other:
/dev/audio & /dev/audio1 - seems to be equal to dsp
/dev/sequencer and /dev/midi0[0-3] - seem to be something around midi :)
 - theese are not used (now)
but:
the /dev/dsp and /dev/dsp1 cannot work simultaneously:
neither two plays, nor Full Duplex (one to play,another to record)
-though I've specified _two_ DMA channels, the second one is 16bit (as
it is said in docs)
there are no other ISA cards in a box (the 5Ali61 motherboard i.e.
Alladin IV chipset)

can someone help me 
or point the places on the WWW where I can read about GUS and it's use
under Linux??

Hope world will help 
Sergey
