From: robbie@scot-mur.demon.co.uk
Date: Wed, 10 Feb 1999 15:08:08 +0000
Subject: Re: cheap pci sound card with full duplex support?
Message-Id: <marc-linux-sound-91865978010209@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91762722501635@msgid-missing>
In-Reply-To: <marc-linux-sound-91762722501635@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Tue, Feb 09, 1999 at 07:06:12PM +0100, DAVID BALAZIC wrote:
> Ensoniq AudioPCI is supported in kernel 2.2.x.
> It may also work under 2.0.x with the ALSA drivers ( http://alsa.jcu.cz )
> 
> I have a Soundblaster 64 PCI ( which is actually an Ensoniq AudioPCI 
> with a soudblaster sticker on it ) and it works under linux 2.2.1.
> 
> Wave out and mixer works , haven't tested the rest.
> Its a cool card , which support 4 channel sound ! 
Hi

How good is the quality of this card, compared to cs4231a chip? (From
/dev/sndstat, I haven't actually looked at the chip on the card. ) I
currently have a problem using full duplex when there is ide disk
activity. I have to kill update to make it work, which is probably a bad
idea? I have a via chipset. 

What is the best quality card (I don't care about wave table stuff, just
dac/adc and full duplex)which will work with linux? Preferably with a free
driver.

Regards

Rob
