From: Neale Banks <neale@lowendale.com.au>
Date: Sat, 16 Nov 2002 09:29:47 +0000
Subject: Re: creating a software driver
Message-Id: <marc-linux-sound-103743925928067@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-103742816723431@msgid-missing>
In-Reply-To: <marc-linux-sound-103742816723431@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi Chris,

On Sat, 16 Nov 2002, Chris Ison wrote:

> does anyone know where I can get docs for creating a kernel level
> software only driver for linux. The only docs anf howto's I can find
> just have a simple hello world example.

Have you looked in the O'Reilly book "Writing Linux Device Drivers"?

> A pointer to some software only module source in the linux kernel would
> be acceptable, but so far have only found pci hardware drivers.
> 
> The aim is to create a gpl's software midi driver so I can use/create
> midi editors/players and such.

Ah, maybe the alsa virmidi driver would be a helpful start?

BTW, timidity is supposed to be able to operate as an "ALSA Client" -
which looked hopeful for my Toshi with ALi5451 (has synth, but no Linux
support :-( ) but I couldn't get this to work.  What do your plans include
that wouldn't be done by getting timidity working as an ALSA client?

Regards,
Neale.

