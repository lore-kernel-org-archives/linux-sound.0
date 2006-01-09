From: =?iso-8859-1?q?Ren=E9_Rebe?= <rene@exactcode.de>
Date: Mon, 09 Jan 2006 17:12:55 +0000
Subject: Re: [Alsa-devel] Re: [OT] ALSA userspace API complexity
Message-Id: <200601091812.55943.rene@exactcode.de>
List-Id: <linux-sound.vger.kernel.org>
References: <20050726150837.GT3160@stusta.de> <200601091405.23939.rene@exactcode.de> <Pine.LNX.4.61.0601091637570.21552@zeus.compusonic.fi>
In-Reply-To: <Pine.LNX.4.61.0601091637570.21552@zeus.compusonic.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannu Savolainen <hannu@opensound.com>
Cc: Jaroslav Kysela <perex@suse.cz>, Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org, ALSA development <alsa-devel@alsa-project.org>, LKML <linux-kernel@vger.kernel.org>

Hi,

On Monday 09 January 2006 16:10, Hannu Savolainen wrote:

> > > I don't think so. The library can do such conversions (and alsa-lib does) 
> > > quite easy. If we have a possibility to remove the code from the kernel 
> > > space without any drawbacks, then it should be removed. I don't see any 
> > > advantage to have such conversions in the kernel.
> > 
> > Also, when the data is already available as single streams in a user-space
> > multi track application, why should it be forced interleaved, when the hardware
> > could handle the format just fine?
> Because the conversion doesn't cost anything. Trying to avoid it by 
> making the API more complicated (I would even say confusing) is extreme 
> overkill. 

Since when doesn't cost convesion anything? I'm able to count a lot of wasted
CPU cycles in there ...

> Even worse this kind of features weaken the device abstraction provided by 
> the API. The applications will have to check for this and 
> that and provide support for 100s of special cases that may be required by 
> certain devices. 

An lame write() only player can still open the default device and get the auto-convert
chain it deserves ...

Yours,
  Rene Rebe

-- 
ExactCODE Berlin
