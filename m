From: Craig Wright <spiral@cs.unm.edu>
Date: Tue, 02 May 2000 23:33:12 +0000
Subject: Sound devices in /dev/
Message-Id: <marc-linux-sound-95731069101401@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org



Hi, 

I just got a soundblaster 16 pci and after some trouble got it working a 
little bit.  I can play CD's with workman and the sound comes out of the
card.  That's good :), but I'm missing /dev/audio and /dev/sndstat and any
other sound device that I may need.  (I don't know what the others may
be, /dev/dsp?)  Anyway I've run /dev/MAKEDEV and nothing new is created.
I'm at a hurdle I can't jump by myself.  Can anyone help me?  I've tried
using mknod myself, but don't know why they mean by minor and major device
numbers mean.  

Here is the output from the kernel on bootup:

es1371: version v0.19 time 00:44:39 May  1 2000
es1371: found adapter at io 0xe000 irq 5
es1371: features: joystick 0x200
es1371: codec vendor CRY revision 19
es1371: codec features Headphone out 20bit DAC 18bit ADC
es1371: stereo enhancement: Crystal Semiconductor 3D Stereo Enhancement

and here is the output from lspci.  


00:00.0 Host bridge: Acer Laboratories Inc. [ALi] M1541 (rev 04)
00:01.0 PCI bridge: Acer Laboratories Inc. [ALi] M5243 (rev 04)
00:02.0 USB Controller: Acer Laboratories Inc. [ALi] M5237 USB (rev 03)
00:07.0 ISA bridge: Acer Laboratories Inc. [ALi] M1533 PCI to ISA Bridge [Aladdin IV] (rev c3)
00:08.0 Multimedia audio controller: Ensoniq ES1371 [AudioPCI-97] (rev 08)
00:0a.0 VGA compatible controller: S3 Inc. 86c325 [ViRGE] (rev 06)
00:0f.0 IDE interface: Acer Laboratories Inc. [ALi] M5229 IDE (rev c1)


I think this is all relevant, but I don't know for sure.  Can anyone help?

Thanks in advance, 

-- 
Craig             
<spiral@cs.unm.edu>
