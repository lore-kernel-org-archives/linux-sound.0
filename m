From: "Nerijus" <nerijus@prototechnika.lt>
Date: Tue, 17 Nov 1998 18:56:42 +0000
Subject: RE: sound blaster awe64 and "mod_firmware_load"
Message-Id: <marc-linux-sound-91139174417190@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91098502923768@msgid-missing>
In-Reply-To: <marc-linux-sound-91098502923768@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Thanks for Mr. Yun YoungSun who helped:

I had the same problem in 2.1.127, 128.
As you know, sb.o is called by kmod utility for enabling sound card.
I found that in Makefile, if CONFIG_SOUND=y (not module), then soundcore.o
isn't created.
But if the CONFIG_SOUND=m, then everything is fine.


-----Original Message-----
From: Nerijus Baliunas
Sent: Friday, November 13, 1998 7:05 PM
To: 'linux-sound@vger.rutgers.edu'
Subject: sound blaster awe64 and "mod_firmware_load"


I am having a problem with sound in kernel 2.1.127. I have also tried
kernels 112, 125.
I have SB AWE64 plug and play. Kernel is compiled with sound module support.
When I boot I get message:
/lib/modules/2.1.127/misc/sb.o: unresolved symbol mod_firmware_load
sound: Device or resource busy

My /etc/conf.modules:
alias sound sb
options -k sb io=0x220 irq=5 dma=1 dma16=5 mpu_io=0x330

When in /usr/src/linux/drivers/sound/sb_common.c
I comment lines between #ifdef and #endif, sound works:
#ifdef MODULE
/*	if (!smw_ucode)
	{
		extern void *smw_free;

		smw_ucodeLen = mod_firmware_load("/etc/sound/midi0001.bin",
(void *) &smw_ucode);
		smw_free = smw_ucode;
	}
*/
#endif


Also there is a newer awe lowlevel driver ver.0.4.2d in
http://bahamut.mm.t.u-tokyo.ac.jp/~iwai/awedrv/index.html
Why isn't it included in kernel source?


My kernel .config:

#
# Sound
#
CONFIG_SOUND=y
# CONFIG_SOUND_ES1370 is not set
# CONFIG_SOUND_ES1371 is not set
# CONFIG_SOUND_SONICVIBES is not set
# CONFIG_SOUND_MSNDCLAS is not set
# CONFIG_SOUND_MSNDPIN is not set
CONFIG_SOUND_OSS=m
# CONFIG_SOUND_PAS is not set
CONFIG_SOUND_SB=m
CONFIG_SOUND_ADLIB=m
# CONFIG_SOUND_GUS is not set
# CONFIG_SOUND_MPU401 is not set
# CONFIG_SOUND_PSS is not set
# CONFIG_SOUND_MSS is not set
# CONFIG_SOUND_SSCAPE is not set
# CONFIG_SOUND_TRIX is not set
# CONFIG_SOUND_MAD16 is not set
# CONFIG_SOUND_WAVEFRONT is not set
# CONFIG_SOUND_CS4232 is not set
# CONFIG_SOUND_OPL3SA2 is not set
# CONFIG_SOUND_MAUI is not set
# CONFIG_SOUND_SGALAXY is not set
# CONFIG_SOUND_OPL3SA1 is not set
# CONFIG_SOUND_SOFTOSS is not set
CONFIG_SOUND_YM3812=m
# CONFIG_SOUND_VMIDI is not set
# CONFIG_SOUND_UART6850 is not set

#
# Additional low level sound drivers
#
CONFIG_LOWLEVEL_SOUND=y
# CONFIG_ACI_MIXER is not set
CONFIG_AWE32_SYNTH=m


regards,
Nerijus
