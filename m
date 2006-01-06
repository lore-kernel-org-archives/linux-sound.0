From: Lee Revell <rlrevell@joe-job.com>
Date: Fri, 06 Jan 2006 00:03:28 +0000
Subject: Re: [OT] ALSA userspace API complexity
Message-Id: <1136505809.6035.3.camel@mindpipe>
List-Id: <linux-sound.vger.kernel.org>
References: <20050726150837.GT3160@stusta.de>
	 <20060103193736.GG3831@stusta.de>
	 <Pine.BSO.4.63.0601032210380.29027@rudy.mif.pg.gda.pl>
	 <mailman.1136368805.14661.linux-kernel2news@redhat.com>
	 <20060104030034.6b780485.zaitcev@redhat.com>
	 <Pine.LNX.4.61.0601041220450.9321@tm8103.perex-int.cz>
	 <Pine.BSO.4.63.0601051253550.17086@rudy.mif.pg.gda.pl>
	 <Pine.LNX.4.61.0601051305240.10350@tm8103.perex-int.cz>
	 <Pine.BSO.4.63.0601051345100.17086@rudy.mif.pg.gda.pl>
	 <s5hmziaird8.wl%tiwai@suse.de>
	 <Pine.LNX.4.61.0601060028310.27932@zeus.compusonic.fi>
	 <1136504364.847.88.camel@mindpipe>
	 <Pine.LNX.4.61.0601060153440.27932@zeus.compusonic.fi>
In-Reply-To: <Pine.LNX.4.61.0601060153440.27932@zeus.compusonic.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannu Savolainen <hannu@opensound.com>
Cc: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, 2006-01-06 at 01:56 +0200, Hannu Savolainen wrote:
> On Thu, 5 Jan 2006, Lee Revell wrote:
> 
> > On Fri, 2006-01-06 at 01:06 +0200, Hannu Savolainen wrote:
> > > > - PCM with 3-bytes-packed 24bit formats
> > > Applications have no reasons to use for this kind of stupid format so
> > > OSS translates it to the usual 32 bit format on fly. In fact OSS API
> > > does have support for this format. 
> > 
> > What about hardware that only understands this format?
> There is no such hardware. Or is there?
> 

Yep, the Roland SC-D70 and EDIROL UA-5 in "advanced mode", I guess it
lets them cram more channels of 24 bit audio over a slow USB pipe.  It's
no fun...

Lee

