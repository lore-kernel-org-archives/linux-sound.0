From: Dave Phillips <dlphilp@bright.net>
Date: Tue, 11 Jul 2000 15:50:53 +0000
Subject: Re: Ensonic AudioPCI sound card problems
Message-Id: <marc-linux-sound-96333065316133@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-96332630904955@msgid-missing>
In-Reply-To: <marc-linux-sound-96332630904955@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Jay Ts wrote:

> Another possibility is to try the ALSA driver; I read on the web that
> it supports the AudioPCI.  Anyone want to comment on that?

If the card is an Ensoniq, I think you just use the ens1370 driver from
ALSA. I've used the ens1370 and ens1371 drivers successfully, but those
were for the Creative Labs versions of that card (Ensoniq AudioPCI sort
of equals the SoundBlaster PCI128).

Best regards,

= Dave Phillips

	http://www.bright.net/~dlphilp/index.html
	http://www.bright.net/~dlphilp/linuxsound/
