From: Keith Duthie <psycho@albatross.co.nz>
Date: Mon, 26 Apr 1999 17:34:34 +0000
Subject: Re: 3D Soundpro PCI
Message-Id: <marc-linux-sound-92514863411662@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92514107603834@msgid-missing>
In-Reply-To: <marc-linux-sound-92514107603834@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Mon, 26 Apr 1999, Eduardo Trettel wrote:

> I've already read this doc, but it describes the ISA version of the board,
> which is much easier to configure, as long as the I/0 addresses are the
> same of the SB16. I'm not sure how to handle this on the PCI version. 
> Any hints will be welcomed.
Isn't this set up by the pci subsystem? If so, then try looking at
/proc/pci to get the io port and interrupt. If not, it may not actually
*be* pci.

Note: you could try assigning an interrupt to it in bios

( If the kernel driver doesn't work, you could try alsa at
http://www.alsa-project.org )
-- 
Understanding is a three edged sword. Do you *want* to get the point?
         http://www.albatross.co.nz/~psycho/        O-
