From: Bill Nottingham <notting@redhat.com>
Date: Thu, 13 May 1999 02:28:56 +0000
Subject: Re: Bidirectionnal sound card
Message-Id: <marc-linux-sound-92660876515076@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92652008522117@msgid-missing>
In-Reply-To: <marc-linux-sound-92652008522117@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Marc SCHAEFER (schaefer@alphanet.ch) said: 
> I would like to buy a bidirectionnal sound card, able to record
> and play at the same time. Someone told me that the
> SoundBlaster 128 PCI was hardware-wise able to do that, and
> also Linux supported with this feature.

If you want to do true full-duplex, you should be able to use
(unless I'm horribly mistaken):

- Ensoniq ES1370/1371 (Sound Blaster PCI64/128, AudioPCI)
- S3 SonicVibes (not recommended)
- Trident 4DWave DX/NX
- CS423x based cards

> What driver is to be used, BTW ?  Is there any open-source (no cost
> or not) driver fulfilling my needs ?

For the Trident 4DWave cards, you'd need to use the ALSA drivers
(http://alsa.jcu.cz/), for the other cards you can use either
ALSA drivers or the standard kernel drivers.

Bill
