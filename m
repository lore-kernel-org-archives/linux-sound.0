From: Miles Lane <miles@speakeasy.org>
Date: Wed, 03 May 2000 06:55:24 +0000
Subject: 2.3.99-pre7-2 -- Cannot load cs4232 when built as module
Message-Id: <marc-linux-sound-95733742919067@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I get this error when I attempt to load the driver.

May  2 16:13:10 spot kernel: ad1848/cs4248 codec driver Copyright (C) by
Hannu Savolainen 1993-1996 
May  2 16:13:10 spot kernel: cs4232.c: I/O port 0xffffffff not free 

cat /proc/iomem shows:

00000000-0009f7ff : System RAM
0009f800-0009ffff : reserved
000a0000-000bffff : Video RAM area
000c0000-000c7fff : Video ROM
000f0000-000fffff : System ROM
00100000-04ffffff : System RAM
00100000-0021a09f : Kernel code
0021a0a0-00230cbb : Kernel data
10000000-10000fff : Texas Instruments PCI1131
10001000-10001fff : Texas Instruments PCI1131 (#2)
10400000-107fffff : PCI CardBus #01
10400000-1041ffff : PCI device 10b7:5157
10800000-10bfffff : PCI CardBus #01
10800000-1080007f : PCI device 10b7:5157
10800080-108000ff : PCI device 10b7:5157
10c00000-10ffffff : PCI CardBus #03
11000000-113fffff : PCI CardBus #03
a0000000-a0000fff : card services
fd000000-fdffffff : Neomagic Corporation NM2160 [MagicGraph 128XD]
fea00000-febfffff : Neomagic Corporation NM2160 [MagicGraph 128XD]
fed00000-fedfffff : Neomagic Corporation NM2160 [MagicGraph 128XD]
ffff0000-ffffffff : reserved
