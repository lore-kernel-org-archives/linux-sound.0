From: Dave Mielke <dave@mielke.cc>
Date: Tue, 23 May 2000 12:03:25 +0000
Subject: Re: OSS/Free /dev/audio full duplex sound format.
Message-Id: <marc-linux-sound-95908356417170@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95903210912907@msgid-missing>
In-Reply-To: <marc-linux-sound-95903210912907@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

[quoted lines by paco@hydrofunk.org on May 22, 2000, at 15:29]

>As for why it switched on you in the first place... I have no idea.

I'm using the 2.2.12-20 kernel, as suplied by RedHat6.1, and the OSS/Free
drivers which it contains. If I open /dev/audio just for input (O_RDONLY), then
it delivers sound in mu_law format. If I open it just for output (O_WRONLY),
then it interprets sound in mu_law format. If I open it for both input and
output (O_RDWR), then it delivers sound in mu_law format, but, and this is my
problem, it interprets sound in unsigned 8-bit format (as though it were
/dev/dsp). My /etc/conf.modules contains the following:

   alias sound sb
   alias midi awe_wave
   options sb io=0x220 irq=5 dma=1 dma16=5 mpu_io=0x330
   pre-install sound insmod sound dmabuf=1
   pre-install awe_wave modprobe opl3
   options opl3 io=0x388
   post-install awe_wave /bin/sfxload /etc/midi/GU11-ROM.SF2


Have I done anything wrong? Is it probably a bug in the sound driver, or might
the dmabuf=1 option to the sound module have something to do with it?

-- 
Dave Mielke           | 856 Grenon Avenue | I believe that the Bible is the
Phone: 1-613-726-0014 | Ottawa, Ontario   | Word of God. Please contact me
EMail: dave@mielke.cc | Canada  K2B 6G3   | if you're concerned about Hell.
