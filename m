From: Ofer Achler <oachler@ucsd.edu>
Date: Tue, 26 Nov 2002 07:07:41 +0000
Subject: Re: AZT1008 on HP Vectra VL6
Message-Id: <marc-linux-sound-103829448100754@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-103825052826476@msgid-missing>
In-Reply-To: <marc-linux-sound-103825052826476@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org



Zwane Mwaikambo wrote:
> You're sure it can be supported by ad1848?
> 

Pretty sure =) as far as i can tell via google (also, sndconfig by
default used ad1848, so it's listed somewhere)

> Might be a simple matter of ISA pnp ids, but then again the ad1848 probe
> should have picked it up regardless. What does /proc/ioports and
> /proc/interrupts and dmesg say after the module load?

first off, when i use sndconfig, this is the error it gives:
sndconfig says:
     # /lib/modules/2.4.18-18.8.0/kernel/drivers/sound/ad1848.o:        
# 
     # init_module: No such device                                      
# 
     # /lib/modules/2.4.18-18.8.0/kernel/drivers/sound/ad1848.o:        
# 
     # insmod /lib/modules/2.4.18-18.8.0/kernel/drivers/sound/ad1848.o  
# 
     # failed                                                           
# 
     # /lib/modules/2.4.18-18.8.0/kernel/drivers/sound/ad1848.o:        
# 
     # insmod sound-slot-0 failed  

when i insmod manually:

dmesg says:
ad1848/cs4248 codec driver Copyright (C) by Hannu Savolainen 1993-1996
ad1848: No ISAPnP cards found, trying standard ones...


its not listed under interrupts, but heres the output:
           CPU0       
  0:   46137052          XT-PIC  timer
  1:          4          XT-PIC  keyboard
  2:          0          XT-PIC  cascade
  8:          1          XT-PIC  rtc
 10:    1130131          XT-PIC  usb-uhci, eth1
 11:     500694          XT-PIC  eth0
 14:      44411          XT-PIC  ide0
 15:      18853          XT-PIC  ide1
NMI:          0 
ERR:          0


It's not listed under ioports either:

0000-001f : dma1
0020-003f : pic1
0040-005f : timer
0060-006f : keyboard
0070-007f : rtc
0080-008f : dma page reg
00a0-00bf : pic2
00c0-00df : dma2
00f0-00ff : fpu
0170-0177 : ide1
01f0-01f7 : ide0
0213-0213 : isapnp read
0376-0376 : ide1
03c0-03df : vga+
03f6-03f6 : ide0
03f8-03ff : serial(auto)
0a79-0a79 : isapnp write
0cf8-0cff : PCI conf1
8000-803f : Intel Corp. 82371AB/EB/MB PIIX4 ACPI
8800-881f : Intel Corp. 82371AB/EB/MB PIIX4 ACPI
fc00-fc7f : 3Com Corporation 3c900B-TPO [Etherlink XL TPO]
  fc00-fc7f : 00:0c.0
fca0-fcbf : Intel Corp. 82371AB/EB/MB PIIX4 USB
  fca0-fcbf : usb-uhci
fcd0-fcdf : Intel Corp. 82371AB/EB/MB PIIX4 IDE
  fcd0-fcd7 : ide0
  fcd8-fcdf : ide1
fce0-fcff : Intel Corp. 82557/8/9 [Ethernet Pro 100]
  fce0-fcff : eepro100


Here's the relevant output of lsmod:
ad1848                 28588   0  (unused)
sound                  74388   0  [ad1848]
soundcore               6532   2  [sound]


Thank you for helping me =) i've been stuck on this for a while now and
i know i've got to be close...

-- Ofer Achler
   oachler@ucsd.edu


