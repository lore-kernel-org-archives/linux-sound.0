From: DAVID BALAZIC <david.balazic@uni-mb.si>
Date: Tue, 09 Feb 1999 18:06:12 +0000
Subject: Re: cheap pci sound card with full duplex support?
Message-Id: <marc-linux-sound-91858369316314@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91762722501635@msgid-missing>
In-Reply-To: <marc-linux-sound-91762722501635@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

>I would like to get a sound card that can do full duplex under linux (ie
>open /dev/dsp with mode O_RDWR).  I see cards like the "Ensoniq AudioPCI"
>for around 20 bucks that claim to do full duplex, but I don't know whether
>there's a linux driver.
>
>So, my question: are there sound cards (preferably PCI) for around $20
>that have full duplex support under linux?  Are the drivers free?
>
>Thanks,
>Roland
>dreier@math.okstate.edu

Ensoniq AudioPCI is supported in kernel 2.2.x.
It may also work under 2.0.x with the ALSA drivers ( http://alsa.jcu.cz )

I have a Soundblaster 64 PCI ( which is actually an Ensoniq AudioPCI 
with a soudblaster sticker on it ) and it works under linux 2.2.1.

Wave out and mixer works , haven't tested the rest.
Its a cool card , which support 4 channel sound ! 

But also  have a cosmetic bug - in order to record a sound, you must
set it to play ( hear it on the output of your card ),
the microphone is an exception, otherwise it would be unusable.

This way you can't play a sound and record it back from AUX-in using a cable to
connet ( LINE-out and AUX-in ) , for example to test the characteristics of
the card ...


--
David Balazic , student
E-mail   : 1stein@writeme.com     |     living in  sLOVEnija
home page: http://surf.to/stein
Computer: Amiga 1200 + Quantum LPS-340AT
--
