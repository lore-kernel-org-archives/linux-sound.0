From: Thomas Sailer <sailer@ife.ee.ethz.ch>
Date: Sat, 09 Jan 1999 14:11:55 +0000
Subject: Re: SoundBlasterPCI128
Message-Id: <marc-linux-sound-91593962828860@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91584820831233@msgid-missing>
In-Reply-To: <marc-linux-sound-91584820831233@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Balaguru Nallathambi wrote:
> 
> HI,
>         I have a SoundBlaster PCI 128. Does linux have support for this.
> Are there any drivers for this card, which I can download.
> 
>         I compiled the kernel with the sound as a module.
>         The kernel could not detect the sound card.

CONFIG_EXPERIMENTAL=y
CONFIG_SOUND_ES1371=y or m

You need either 2.0.36 plus Alan Cox modular sound patch
or 2.2.pre

Tom
