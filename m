From: Keith Duthie <psycho@albatross.co.nz>
Date: Thu, 18 Feb 1999 12:27:21 +0000
Subject: Re: YAMAHA DS-XG
Message-Id: <marc-linux-sound-91934044010078@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91933602203242@msgid-missing>
In-Reply-To: <marc-linux-sound-91933602203242@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Thu, 18 Feb 1999, Andrzej Komar wrote:

> Anybody know how to install YAMAHA DS-XG SoundBlaster ( its on-board on
> Intel SE440BX-2 motherboard) Full name- YAMAHA YMF740 DS-1L PCI audio
> controller.
Which soundblaster card is it a clone of? Soundblaster Pro? Soundblaster
16? 

> I use Linux Mandrake 5.3 (compatible with RedHat 5.2)
??? That's a distribution version. Which kernel version are you running?

First suggestion: do `cat /proc/pci` and look through the results for the
soundblaster device. Then do `modprobe sb io=0x220 irq=5 dma=1 dma16=5 \
mpu_io30` substituting in the values which /proc/pci will give you.
-- 
.sig under deconstruction. Please watch out for falling stars.
