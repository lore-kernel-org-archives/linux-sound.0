From: ljp <llornkcor@llornkcor.com>
Date: Sun, 16 May 1999 05:43:14 +0000
Subject: Re: Sound Blaster AWE64 Gold
Message-Id: <marc-linux-sound-92687887905966@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92682907516413@msgid-missing>
In-Reply-To: <marc-linux-sound-92682907516413@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Oki, here ya go- :o)

# Sound
#
CONFIG_SOUND=m
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
# CONFIG_AEDSP16 is not set

#

On Sat, 15 May 1999, Buffy wrote:
> Hi all,
> 
> 	I need help about the configuration part of the kernel (2.2.9) for
> my SB AWE64 Gold : can anyone send me the .config part named "Sound" so
> that I can compile it properly ? Another question is : with RedHat 5.2,
> shall I need to make "setup" and "sndconfig" ? If I shall, could you tell
> me what choices I have to take for my sound card ?
> 
> Thank you a lot :)
> 
> \-=-=-=-=-=-=-=-=-=-/
> | * * B-U-F-F-Y * * |
> | +33 6.15.11.88.94 |
> /-=-=-=-=-=-=-=-=-=-\
