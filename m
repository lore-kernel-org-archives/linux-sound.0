From: Britton <fsblk@aurora.alaska.edu>
Date: Wed, 10 Feb 1999 17:20:18 +0000
Subject: Re: mpeg2 support in kernel?
Message-Id: <marc-linux-sound-91866739517872@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91863075621412@msgid-missing>
In-Reply-To: <marc-linux-sound-91863075621412@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


On Wed, 10 Feb 1999, Erik de Castro Lopo wrote:

> Britton wrote:
> > 
> > I see the following snipet of code in the O'Reilly Linux Multimedia Guide:
> > 
> > if (formats & AFMT_MPEG) {
> >   printf("  MPEG 2");
> >   (deffmt = AFMT_MPEG) ? printf(" (default)\n") : printf("\n");
> > }
> > 
> > Is there something you can compile into the kernel that will let the "dsp"
> > produce mpeg 2 encoded stuff?  If so I'd love to know about it.
> 
> MPEG encoding/decoding does not belong in the kernel but in a 
> user space program or library. The libary option is probably
> best.

That's what I'd have thought.  So the above snipet of code is testing for
that support in one of the included files?


Britton Kerin
