From: Britton <fsblk@aurora.uaf.edu>
Date: Thu, 08 Jun 2000 22:25:46 +0000
Subject: Re: how to find the maximum fragment size for SNDCTL_DSP_SETFRAGMENT?
Message-Id: <marc-linux-sound-96050332718065@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-96049072503276@msgid-missing>
In-Reply-To: <marc-linux-sound-96049072503276@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


On Fri, 9 Jun 2000, Hannu Savolainen wrote:
> On Thu, 8 Jun 2000, Britton wrote:
> 
> > 
> > The guide of 4front's web page says total_buffer_size/2.  I know the
> > kernel buffer size used to be defined at kernel compile time.  How does
> > one go about determining it now?  DSP_GETBLKSZ?
> Wy would you need this information? 

I'm letting my users specify the fragment size, and I try to check things
like whether what they specify is out of range before actually making the
syscall.

> If you like to get as large fragments as possible just set the fragment
> size to very big. The driver will then select the largest one it could
> support.

Ok, I didn't know it would do that.  I guess there is no real reason the
user needs to know if their large fragment size was not actually set (they
already get a warning if the fragment size they request is big enough that
it will likely cause latency).  That behavior might be something to add to
the 4front page.

> However changing the fragment size bigger than the default doesn't give
> any benefit. You can always write/read multiple fragments at time to get
> the same effect.
> 
> > Does DSP_GETBLKSZ still
> > fix the block size so that the device must be closed and opened again in
> > order to set the fragment size?
> This is the current and future behaviour.

Thanks,
Britton
