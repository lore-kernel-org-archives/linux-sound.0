From: David Nedved <dnedved@nuvox.net>
Date: Thu, 28 Jun 2001 18:04:29 +0000
Subject: Strange issue with opl3sa2 driver under linux 2.4.4
Message-Id: <marc-linux-sound-99375164302844@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi all,

I'm trying to get sound working on my laptop, and  I'm having some strange
problems getting it work as expected, and I hope that you can give me some
insight.  I have a Toshiba Libretto 70CT, which is one of the hardware
platforms that is mentioned as working in the docs... I CAN get sound out of
it, but only after a strange ritual...

I have to do this to get it to work:

#modprobe opl3sa2 io=0x220 mss_io=0x530 mpu_io=0x330 irq=5 dma=1 dma2=0
opl3sa2: Control I/O port 0x220 is not a YMF7xx chipset!
#modprobe opl3sa2 io=0x370 mss_io=0x530 mpu_io=0x330 irq=5 dma=1 dma2=0
opl3sa2: Control I/O port 0x370 is not free
opl3sa2: Control I/O port 0x370 is not free
opl3sa2: Control I/O port 0x370 is not free
#modprobe opl3sa2 io=0x220 mss_io=0x530 mpu_io=0x330 irq=5 dma=1 dma2=0

notice that I have to modprobe it FIRST at 0x370, it fails, then it will
insert into 0x220!  I have verified all the settings through both the BIOS
setup utility and by dual-booting into Windows98.

This is with kernel version 2.4.4.  Do you have any idea about why it is
acting so strange upon inserting?  In /proc/ioports it lists 0x370 as belonging
to OPL3-SA3, and 0x220 is not listed, however 0x220 is 
the address that it ends up working under both in Windows98 and Linux.

Thanks very much, I really hope you have some idea how to work around this
more elegantly (so that maybe I can boot and have sound without typing all
that junk!)  If there's anything I can do to experiment around that would help
others, just let me know and I'll be happy to do it.

Thanks once again,

David
-
To unsubscribe from this list: send the line "unsubscribe linux-sound" in
the body of a message to majordomo@vger.kernel.org
