From: Tuukka Toivonen <tuukkat@ees2.oulu.fi>
Date: Mon, 07 Dec 1998 15:35:27 +0000
Subject: Re: GUS MAX problem
Message-Id: <marc-linux-sound-91305955829718@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91295518418565@msgid-missing>
In-Reply-To: <marc-linux-sound-91295518418565@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Sun, 6 Dec 1998, Benoit Rouits wrote:

>I've got a problem with my 2.0.31 kernel
> and standard driver for GUS that is :

I have also GUS MAX 512k and it has always worked fine. But I have very
rarely used the standard Linux sound drivers, because I have found that
Linux Ultra Sound Project drivers work better. You might try them

http://home.pf.jcu.cz/~perex/ultra/

There's also ALSA project, but for me the Ultra drivers work better.

http://alsa.jcu.cz

I'm using kernel 2.0.36 right now but everything has worked fine with
few older kernels too.

> well under Micro$oft and I'm sure to not have any irq or dma conflicts.

You might try giving commands
 cat /proc/interrupts
and
 cat /proc/ports
and
 cat /proc/dma
(if i remembered the file names right. if not, peek around under /proc
directory).
They should help resolving irq/dma conflicts _if_ you have one. But if
you're sure it's not a conflict, you can ignore this.

Anyway, my GUS has DMA 5 and 6 and IRQ 11 and port 220h.

--
| Tuukka Toivonen <tuukkat@ee.oulu.fi>       [PGP public key
| Homepage: http://www.ee.oulu.fi/~tuukkat/       available]
| Try also finger -l tuukkat@ee.oulu.fi
| Studying information engineering at the University of Oulu
+-----------------------------------------------------------
