From: Ac <u98101@cs.unipune.ernet.in>
Date: Wed, 13 Oct 1999 07:16:29 +0000
Subject: Yamaha OPL3-Sax support for RH 6.0 kernel=2.2.5-15
Message-Id: <marc-linux-sound-93979856809463@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi all,
	I'm trying to recompile my kernel (RH 6.0, 2.2.5-15) with Yamaha
OPL3-Sax support built in. I want to know what options to give in
make - xconfig/config/menuconfig, since after compilation
(make dep,make clean, make bzImage, make modules), when I try to run 
'sndconfig' or even 'setup' to configure sound, Tux just freezes and I 
have to do a cold-boot, which is irritating due to the check-forced 
mounting I must go through when it boots next time.

	I'm sure the problem lies with IRQ's and DMA settings. Also I'm 
confused whether to use the MPU-401 during compilation or not.

	My computer specs are P-II Celeron 333, 64MB RAM, running Win98 and 
loadlin to boot Linux. (and I do copy the updated bzImage to my c: 
drive to use with loadlin.). There are no IRQ clashes in Win98, since I'm 
really using no devices not even a modem.

	Hoping some of you out there can help me, so thx. in advance and 
peace on this bandwidth.

Bye,
Ac.
