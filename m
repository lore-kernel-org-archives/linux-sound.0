From: Oliver Helmling <oliver.helmling@stud.uni-bayreuth.de>
Date: Fri, 25 Jun 1999 10:06:16 +0000
Subject: Re: Problems with Soundblaster under 2.2.9
Message-Id: <marc-linux-sound-93031186606288@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Achim Jung wrote:
> 
> Hi!
> 
> I upgraded my Linux-Installation from 2.0.36 to 2.2.10. Everything works fine
> except the sound. I have a Soundblaster AWE64 (isa pnp) installed. If I try
> to load the sound modules this eror message comes up:
>   kiste:/usr/src/linux # modprobe sound
>   /lib/modules/2.2.9/misc/sound.o: invalid parameter parm_io
>   /lib/modules/2.2.9/misc/sound.o: insmod /lib/modules/2.2.9/misc/sound.o failed
>   /lib/modules/2.2.9/misc/sound.o: insmod sound failed
> 
> My sound erntries in /etc/conf.modules:
>   alias char-major-14 sb
>   alias sound sb
>   post-install sb /sbin/modprobe "-k" "adlib_card"
>   options sb io=0x220 irq=5 dma=1 dma16=5 mpu_io=0x330
>   options adlib_card io=0x388
> This options are set equivalent to thouse in /etc/isapnp.conf.
> 
> I checked many howtos and rtfmed a lot, but I can't find whats going wrong.
> If anyone has an idea ...
> Thanks!
> 
> Ciao, Achim
> Achim.Jung@gmx.net
hi achim!
try to uncomment the alias sound sb line.
it looks lik you've suse linux 6.1 running. char-major-14 is the sound
module.
by the way this release of suse is really rubbish!!!
for now i'm trying to replace the adlib-card with the opl3 module. it's
pretty a waste of your hardware.

bye
	oliver
