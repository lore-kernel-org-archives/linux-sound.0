From: LuftHans <LuftHans@asu.edu>
Date: Fri, 14 May 1999 00:46:42 +0000
Subject: Re: SB16
Message-Id: <marc-linux-sound-92668122730644@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92661039616424@msgid-missing>
In-Reply-To: <marc-linux-sound-92661039616424@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Thu, 13 May 1999 hcchin@strd.csam.com.my wrote:

> Hi all,
> 
>     I am still having problems with configuring my SB16 sound card. 
>     I am using Slakware with kernal 2.0.30. I compile the kernal with 
> 
>     Sound ? M
>     support for /dev/dsp and /dev/audio ? Y
> 
>     Other I put N. I use the isapnptools_1.17 to configure, I read the 
> manual, readme, and HOW-TO, tring a few times. Still unable to setup my 
> sound card. 
> 
>     (One thing good with Windows'95, the driver is really easy to 
> install, linux must improve with these)
> 
>     Nottingham said that my dirver(Sound Driver:3.5.4-960630) is the old 
> one, will this old one work with SB16? Or how could I get the new sound 
> driver? 
> 
>     The below that show on my Linux:-
> 
> % isapnp /etc/isapnp.conf
> 
> Board 1 has Identity d7 00 00 15 f5 24 00 8c 0e:  CTL0024 Serial No 5621 
> [checksum d7]
> CTL0024/5621[0]{Audio               }: Ports 0x220 0x330 0x388; IRQ5 DMA1 
> DMA5 --- Enabled OK

I had bios probs with this part. Usually it would tell me the device wasn't
available or some such. I moved to a different irq and the probs went away.

options sb io=0x220 irq=9 dma=1 dma16=5 mpu_io=0x330

Nothing else was at 5, but I couldn't use it for sound.

ciao,

der.hans

> % insmod sound
> (I did check sound module was not loaded before this)
> 
> % lsmod 
> 
> Module:        #pages:  Used by:
> sound             10		0
> ppp                5		0
> slip               2		0
> slhc               2	[ppp slip]	0
> lp                 2		0
> 
> BUT
> % cat /dev/sndstat
> 
> Sound Driver:3.5.4-960630 (Tue Mar 2 05:22:12 SGT 1999 root,
> 
> Config options: 0
> 
> Installed drivers: 
> 
> Card config: 
> 
> Audio devices:
> 
> Synth devices: NOT ENABLED IN CONFIG
> 
> Midi devices: NOT ENABLED IN CONFIG
> 
> Timers:
> 
> Mixers:
> 
> So I can't use the device, what is going wrong?
> 
> 

# +++++++++++=================+++++++++++ #
#                   LuftHans@asu.edu                      #
#            http://home.pages.de/~lufthans/              #
#             I've got a photographic memory,             #
#         but I'm lousy photographer. - der.hans          #
# ======+++++++++++++++++++++++++++++++++====== #
