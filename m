From: Simon J Mudd <sjmudd@pobox.com>
Date: Sat, 14 Jun 2003 07:57:07 +0000
Subject: Re: Help configuring a CS4236 to work with Linux
Message-Id: <marc-linux-sound-105557743503962@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-105519659910416@msgid-missing>
In-Reply-To: <marc-linux-sound-105519659910416@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

rautenkranzmt@ionempire.dyndns.org (Michael Rautenkranz) writes:

> Simon J Mudd wrote:
> 
> > I/O Port IRQ DMA 1 DMA 2 MPU I/O MPU IRQ
> >
> >0x530    5   0     0     0x330   5
> >0x534    7   1     1     0x300   7
> >
> >Selecting 0x534,5,1,1,0x330,7
> >
> DMA1 and DMA2 must be different values
> 
> i would suggest 0x534,5,0,1,0x330,7

OK. I'll try these values. Unfortunately the redhat sound config
doesn't explain the values and I don't now have Windows installed on
the machine to see how Windows configured the sound.

Thanks again.

Simon
