From: Gianmaria Collazuol <collazuo@fi.infn.it>
Date: Tue, 23 May 2000 12:37:03 +0000
Subject: Re: OSS/Free /dev/audio full duplex sound format.
Message-Id: <marc-linux-sound-95908582819402@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95903210912907@msgid-missing>
In-Reply-To: <marc-linux-sound-95903210912907@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

>I'm using the 2.2.12-20 kernel, as suplied by RedHat6.1, and the OSS/Free
>drivers which it contains. If I open /dev/audio just for input (O_RDONLY), then
>it delivers sound in mu_law format. If I open it just for output (O_WRONLY),
>then it interprets sound in mu_law format. If I open it for both input and
>output (O_RDWR), then it delivers sound in mu_law format, but, and this is my
>problem, it interprets sound in unsigned 8-bit format (as though it were
>/dev/dsp). My /etc/conf.modules contains the following:
>
>   alias sound sb
>   alias midi awe_wave
>   options sb io=0x220 irq=5 dma=1 dma16=5 mpu_io=0x330
>   pre-install sound insmod sound dmabuf=1
>   pre-install awe_wave modprobe opl3
>   options opl3 io=0x388
>   post-install awe_wave /bin/sfxload /etc/midi/GU11-ROM.SF2
>
>Have I done anything wrong? Is it probably a bug in the sound driver, or might
>the dmabuf=1 option to the sound module have something to do with it?

i've exactly the same problem, kernel and /etc/conf.modules.
consider that even with (all the) different dma, dma16 
channel combinations the problem still remains.
(so as to dmabuf=1: even worse results with a static driver 
built in kernel and not as a module.)  
regards,
  g.collazuol 
