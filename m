From: Bill Nottingham <notting@redhat.com>
Date: Sun, 09 May 1999 03:57:46 +0000
Subject: Re: Neomagic MagicMedia sound card
Message-Id: <marc-linux-sound-92622262008582@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92568050317138@msgid-missing>
In-Reply-To: <marc-linux-sound-92568050317138@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Alexis DOMJAN (disco@igaia.ch) said: 
> A friend of mine got an Acer Travelmate 720TX laptop, and we installed Linux successfully.
> 
> Anyway we've a problem with the sound card. It's described as a Sound Blaster Compatible
> sound card. And it is... but it's only compatible as a Sound Blaster Pro 8 bit sound card.
> 
> When loading sb module we get the following text in the logs:
> 
> SB 3.01 Detected OK (220)
> SB DSP version is just 3.01 which means that your card is
> several years old (8 bit only device) or alternatively the sound
> driver is incorrectly configured.
> 
> The sound card is named as MagicMedia 256AV, from NeoMagic. Do you 
> know if it's possible to use 16 bits with this sound card ?

You should be able to use the ad1848 (aka Windows Sound System) driver
to get 16bit sound out of it.

Bill
