From: Miles Lane <miles@speakeasy.org>
Date: Sat, 10 Jun 2000 05:57:54 +0000
Subject: 2.4.0-test1-ac11 -- cs4232 driver won't load when built into kernel
Message-Id: <marc-linux-sound-96061644322846@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


Is this a bug? 

I get the following message when I boot with 
cs4232 built into the kernel:

   ad1848/cs4248 codec driver Copyright (C) by Hannu Savolainen
1993-1996
   cs4232.c: I/O port 0xffffffff not free

Here's what I have in lilo.conf:

   image=/boot/vmlinuz-2.4.0-test1-ac10
	label=test1-ac10
	read-only
	root=/dev/hda5
	append="cs4232=0x530,5,1,3,0x330,9"

Here are my sound options:

   CONFIG_SOUND=y
   CONFIG_SOUND_OSS=y
   CONFIG_SOUND_TRACEINIT=y
   CONFIG_SOUND_CS4232=y

Here's what's in /proc/iomem:

   00000000-0009f7ff : System RAM
   0009f800-0009ffff : reserved
   000a0000-000bffff : Video RAM area
   000c0000-000c7fff : Video ROM
   000f0000-000fffff : System ROM
   00100000-04ffffff : System RAM
   00100000-002701ef : Kernel code
   002701f0-0028b883 : Kernel data
   10000000-10000fff : Texas Instruments PCI1131
   10001000-10001fff : Texas Instruments PCI1131 (#2)
   10400000-107fffff : PCI CardBus #01
   10800000-10bfffff : PCI CardBus #01
   10c00000-10ffffff : PCI CardBus #03
   11000000-113fffff : PCI CardBus #03
   11000000-11000fff : PCI device 1045:c861
   a0000000-a0000fff : card services
   fd000000-fdffffff : Neomagic Corporation NM2160 [MagicGraph 128XD]
   fea00000-febfffff : Neomagic Corporation NM2160 [MagicGraph 128XD]
   fed00000-fedfffff : Neomagic Corporation NM2160 [MagicGraph 128XD]
   ffff0000-ffffffff : reserved
