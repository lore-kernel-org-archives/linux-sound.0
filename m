From: Kurt Sys <kurt.sys@rug.ac.be>
Date: Thu, 26 Dec 2002 14:12:16 +0000
Subject: debian Woody and sound
Message-Id: <marc-linux-sound-104091198504379@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hello,

I'm rather a newbie to Linux (and to this list) and I've been trying 
already some different distro's. In my opinion, Debian as (by far) the 
best one (I've tried RedHet, Slackware, which I didn't like and SuSe, 
which I think is also OK), but there are a few things I can't get right. 
I have both a desktop and a laptop... and after a few months, I would 
like to get everything working but I just can't get sound working. I 
installed Woody, but it coming with a kernel which doesn't support sound 
(as far as I understand all well), so I recompiled the kernel with 
different sound modules (I compile the 'debian way' and when I 'make 
menuconfig', I choose some different 'sound modules'). On my desktop, I 
have a very standard soundblaster (PCI 128, and I know I/O, IRQ, DMA, 
etc), on my (Dell Inspiron 2650) laptop, it's rather new and I now it's 
a 'integrated intell sound controller'. What's the problem?
I tried to run sndconfig, but it complains about my kernel. It asks for 
a kernel at least 2.2... and I use 2.2.20 on my desktop and 2.4.16 on my 
laptop. I don't get it. I think it searches for a module, sb or snd. 
When I try to 'insmod' the 'soundblaster' (100% compatible things, 
actually the ones I need!?) modules, it failes, for some reason or 
another. I don't know why... So I tried alsa and installed, 
alsa-headers, alsa-modules (but Debian tells me I have to use alsa-base, 
so that's what I do), alsa-utils and alsaconf. If I run alsaconf, I can 
choose some cards and give the right 'parameters', but alsa then it 
fails again, because 'can't locate module snd'.
It's more or less the same story for my laptop... although I have 
actually no idea which 'modules' I have to choose for the soundcard 
which is 'integrated'.


Any suggestions, ideas?

Tnx,
Kurt Sys.

