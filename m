From: Jonathon Horsman <jonathon.horsman@bulletinwireless.com>
Date: Tue, 17 Jun 2003 00:17:48 +0000
Subject: S3 Sonic Vibes Linux driver
Message-Id: <marc-linux-sound-105580909208205@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Greetings,

I obtained this email address from the MAINTAINERS file in the 2.4.21 
kernel source. Apologies if this is the wrong place to ask.


The specified URL in MAINTAINERS:
http://www.ife.ee.ethz.ch/~sailer/linux/pciaudio.html

does not work! I assume should be updated to ~tom/linux/pciaudio.html

Having upgraded from the 2.4.19 kernel, I now receive the following 
error when attempting to load the sonicvibes kernel:

kernel: sv: version v0.31 time 12:14:29 Jun 17 2003
kernel: PCI: Found IRQ 12 for device 02:00.0
kernel: PCI: Failed to allocate resource 7(0-1f) for 02:00.0
kernel: sv: cannot allocate DDMA controller io ports


This is a Redhat 7.3 box, the motherboard does have onboard sound but 
this has been disabled at the bios, so I don't think it should affect it.

Your site gives a command line option: dmaio=x
However I'm uncertain what parameter should be passed here.

lspci -vv gives:

02:00.0 Multimedia audio controller: S3 Inc. SonicVibes
	Subsystem: Unknown device 8000:8000
	Control: I/O+ Mem- BusMaster+ SpecCycle- MemWINV- VGASnoop- ParErr- 
Stepping- SERR- FastB2B-
	Status: Cap- 66Mhz- UDF- FastB2B- ParErr- DEVSEL=medium >TAbort- 
<TAbort- <MAbort- >SERR- <PERR-
	Latency: 32
	Interrupt: pin A routed to IRQ 12
	Region 0: I/O ports at 9000 [size]
	Region 1: I/O ports at 9400 [size]
	Region 2: I/O ports at 9800 [size=4]
	Region 3: I/O ports at 9c00 [size=4]
	Region 4: I/O ports at a000 [size=8]



Any suggestions would be great

Cheers

Jonathon

