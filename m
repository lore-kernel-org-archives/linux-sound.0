From: Greg Wooledge <wooledge@kellnet.com>
Date: Wed, 13 Jan 1999 00:33:49 +0000
Subject: Re: SB16 problem
Message-Id: <marc-linux-sound-91619197817330@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Thanks for the responses, everyone!  I'll only point out the most
interesting comments here, and remove the attributions to preserve a
bit of anonymity.

> No. Sad to say, but it is really 8 bit DMA channel.
> I heard that Vibra does not have 16 bit DMA.
> 
> Hence the error.

This unfortunately matches what the manual hints at (but doesn't
say outright).  In the "BLASTER environment variable" section, it says:

Parameter   Description
----------+----------------------------------------------------------------
  Hx      | High DMA channel used by the audio interface.  x defaults to 5.
          | Sound Blaster 16 model CT4181 only.

> It's correct however - you don't (most probably) have 16 bit sound working.
> Only 8bit. Try realplayer and you'll find that out!

Under my original settings, I had to check the 'Disable 16-bit sound'
box in rvplayer.  However, under my current settings I can hear sounds
with the box checked or un-checked.  I'm leaving it un-checked.

> I think the vibra cards need a little tweak to the sound driver. I haven't had
> time to look. Can you check out a recent driver?

I've also downloaded and tried the OSS commercial driver (demo), version
osslinux392pre-glibc-220-pre6-UP.tar.gz, with 2.2.0-pre6.  I get very
similar results -- there appears to be no 16-bit DMA channel.

(It would have been nice if the OSS pages had told me in advance that
I'd have to use CONFIG_MODVERSIONS in my kernel for their driver to work.
It would have saved me an extra kernel build.  Oh, well.)

> (I moved the vibra that came with my new machine to somewhere else and hung
> on to my classic sb16, which works nicely thank you).

My other soundcard is an sb8. :-(  (It's still in my old machine, which
is now an IP-masq gateway and NFS server.)

> (DMA 1 (CHANNEL 5))
> 
> options sb io=0x220 irq=5 dma=1 dma16=5 mpu_io=0x330
> 
> Could you let me know if this works on your setup?

Those are (some of) the lines I had.  They do not work with the ViBRA
card.  I get the same problem I had originally -- no sound when using
/dev/dsp, and error messages in dmesg.




In summary, it seems I can get the ViBRA to play 16-bit sounds, but
not through a 16-bit DMA channel.  I'm getting the "best" results with
"options sb io=0x220 irq=5 dma=1 dma16=3 mpu_io=0x330" and the first
("preferred") section in /etc/isapnp.conf.  I've successfully played .au,
.wav, .mp3 and .ra sound files, so I'm pretty content.

-- 
Greg Wooledge                    | Distributed.NET http://www.distributed.net/
wooledge@kellnet.com             | because a CPU is a terrible thing to waste.
http://www.kellnet.com/wooledge/ |
