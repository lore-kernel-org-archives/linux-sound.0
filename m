From: Dave Caswell <davec@asylum.apocalypse.org>
Date: Sun, 27 Feb 2000 22:04:39 +0000
Subject: Problem compiling 2.3.48
Message-Id: <marc-linux-sound-95169276902786@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


I get this compile error when trying to compile sound (OPL3-SA2) into
the kernel.

make[3]: Entering directory `/usr/src/linux/drivers/sound'
gcc -D__KERNEL__ -I/usr/src/linux/include -Wall -Wstrict-prototypes -O2 -fomit-frame-pointer -pipe -fno-strength-reduce  -DCPUX6   -DCONFIG_SOUND_AD1848 -DCONFIG_SOUND_MPU_EMU -DCONFIG_SOUND_UART401  -DEXPORT_SYMTAB -c ad1848.c
ad1848.c: In function `ad1848_prepare_for_output':
ad1848.c:1132: `timer_installed' undeclared (first use this function)
ad1848.c:1132: (Each undeclared identifier is reported only once
ad1848.c:1132: for each function it appears in.)
ad1848.c: In function `ad1848_prepare_for_input':
ad1848.c:1246: `timer_installed' undeclared (first use this function)
ad1848.c: In function `adintr':
ad1848.c:2147: `timer_installed' undeclared (first use this function)
ad1848.c: In function `ad1848_tmr_install':
ad1848.c:2685: `timer_installed' undeclared (first use this function)
make[3]: *** [ad1848.o] Error 1

The missing timer_installed variable is wrapped in #ifdef MODULE in
the ad1848.c file.   

#ifdef MODULE

static int timer_installed = -1;

#endif

Thanks,
	Dave Caswell
	davec@apocalypse.org
