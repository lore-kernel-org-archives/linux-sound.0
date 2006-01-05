From: Lee Revell <rlrevell@joe-job.com>
Date: Thu, 05 Jan 2006 23:40:59 +0000
Subject: Re: [OT] ALSA userspace API complexity
Message-Id: <1136504460.847.91.camel@mindpipe>
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
In-Reply-To: <Pine.LNX.4.61.0601060028310.27932@zeus.compusonic.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Hannu Savolainen <hannu@opensound.com>
Cc: Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Fri, 2006-01-06 at 01:06 +0200, Hannu Savolainen wrote:
> We have not received any single bug report that is caused 
> by the concept of kernel mixing.
> Kernel mixing is not rocket science. All you need to do is picking a 
> sample from the output buffers of each of the applications, sum them 
> together (with some volume scaling) and feed the result to the
> physical 
> device. 

Hey, interesting, this is exactly what dmix does in userspace.  And we
have not seen any bug reports caused by the concept of userspace mixing
(just implementation bugs like any piece of software).

Lee

