From: Natanael Copa <nat@c2i.net>
Date: Wed, 16 Jun 1999 17:29:51 +0000
Subject: sbawe and alsa
Message-Id: <marc-linux-sound-92955572431046@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi!

I have some problems to install the alsadrive for sbawe64

when I try modprobe snd-sbawe64 i get this:

/lib/modules/2.3.5/misc/snd-seq-oss.o: init_module: Device or resource
busy
snd: Device or resource busy
snd: Device or resource busy
snd: Device or resource busy

it seems like the pnp is ok and everything except the /dev/sequencer

my conf.modules looks like:

#ISA PnP support
options isapnp isapnp_reserve_irq,13,14,15

#ALSA portion
alias char-major-116 snd
options snd snd_major6 snd_cards_limit=1
alias snd-card-0 snd-sbawe
options snd-sbawe snd_index=1 snd_index=1 snd_id="awe64" snd_port=0x220
\
  snd_mpu_port=0x330 snd_dma8=1 snd_dma16=5 snd_isapnp=1

# OSS/Lite portion
alias sound-slot-0 snd-card-0
alias sound-service-0-0 snd-mixer-oss
alias sound-service-0-3 snd-pcm1-oss
alias sound-service-0-12 snd-pcm1-oss

I run redhat 5.2 with a 2.3.5 kernel.
Natanael
