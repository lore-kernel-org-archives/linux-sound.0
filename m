From: David Luyer <luyer@ucs.uwa.edu.au>
Date: Mon, 18 Oct 1999 05:37:09 +0000
Subject: Re: Yamaha OPL3-Sax support for RH 6.0 kernel=2.2.5-15
Message-Id: <marc-linux-sound-94022506713778@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93979856809463@msgid-missing>
In-Reply-To: <marc-linux-sound-93979856809463@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

> Hi all,
> 	I'm trying to recompile my kernel (RH 6.0, 2.2.5-15) with Yamaha
> OPL3-Sax support built in. I want to know what options to give in
> make - xconfig/config/menuconfig, since after compilation
> (make dep,make clean, make bzImage, make modules), when I try to run 
> 'sndconfig' or even 'setup' to configure sound, Tux just freezes and I 
> have to do a cold-boot, which is irritating due to the check-forced 
> mounting I must go through when it boots next time.

I believe this is from before my fix for OPL3-SA2 non-modular was accepted.
Try a more recent kernel - or if you can find a linux-sound archive my patch
should be in it about 6 months back.

> 	I'm sure the problem lies with IRQ's and DMA settings. Also I'm 
> confused whether to use the MPU-401 during compilation or not.

This is an annoyance.  The sound makefile includes the module whether you 
select it or not, and it is not used (for one of mpu401/uart401 or whatever
anyway).  This is because the person who wrote the sound makefile only seems
to think modular and includes both modules saying "it's only an extra module"
when it gets linked into the kernel if you select it non-modular, it happens
for a couple of sound drivers.

David.
