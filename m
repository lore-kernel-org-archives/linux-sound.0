From: Keith Duthie <psycho@albatross.co.nz>
Date: Wed, 17 Feb 1999 14:03:34 +0000
Subject: Re: Sound Card Problems
Message-Id: <marc-linux-sound-91926558702545@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91922152200751@msgid-missing>
In-Reply-To: <marc-linux-sound-91922152200751@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Here's a new track: make sure you have the AWE32 low level sound module
built. Revert dma16 to 5.

Unload all sound modules, then try the following:
modprobe sound
insmod uart401
insmod sb io=0x220 irq=5 dma=1 dma16=5 mpu_io=0x330
insmod awe_wave

*NOTE* There seems to be a mini-howto on the SB-AWE, and there are a
couple of SB-32/AWE-32 related documents in /usr/src/linux/Documentation/sound

ps did the esstype88 do anything?
pps try uncommenting   options sound dmabuf=1   in your conf.modules
-- 
.sig under deconstruction. Please watch out for falling stars.
