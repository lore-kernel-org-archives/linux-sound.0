From: Joern Nettingsmeier <nettings@folkwang-hochschule.de>
Date: Wed, 10 Jul 2002 09:07:54 +0000
Subject: Re: Status of ALi5451(trident)?
Message-Id: <marc-linux-sound-102629207117676@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-102629084116513@msgid-missing>
In-Reply-To: <marc-linux-sound-102629084116513@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

check on www.alsa-project.org, and ask on the alsa-user list. iirc, it's
supported.

Neale Banks wrote:
> 
> Greetings,
> 
> What is the status (e.g. supposedly working, supported and maintained?)
> of the Trident driver with the Ali5451 chipset (both regular audio and
> MIDI synth)?
> 
> Issues I have on the Toshiba Satellite 1800[1] include:
> 
> 1) not working[2] with 2.2.21
> 2) MIDI not working with 2.2.21 or 2.4.18
> 3) MIDI code appears to be removed in 2.4.17 source (is this a sign?)
> 4) Lack of findable documentation on what's supposed to work and how (yes,
> I'm prepared to collate something for linux/Documentation/sound/)
> 
> Thanks,
> Neale.
> 
> [1] The Toshi 1800's lspci -v output includes:
> 
> 00:06.0 Multimedia audio controller: Acer Laboratories Inc. [ALi] M5451 PCI South Bridge Audio (rev 01)
>         Subsystem: Toshiba America Info Systems: Unknown device 0001
>         Flags: bus master, medium devsel, latency 64, IRQ 11
>         I/O ports at ed00
>         Memory at f7efe000 (32-bit, non-prefetchable)
>         Capabilities: [dc] Power Management version 2
> 
> [2] OK, "not working" isn't really a proper report.  I get this logged
> when something tries to open the audio:
> 
> kernel: trident: drain_dac, dma timeout?
> 
> What else should I be reporting about this?
> 
> -
> To unsubscribe from this list: send the line "unsubscribe linux-sound" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
