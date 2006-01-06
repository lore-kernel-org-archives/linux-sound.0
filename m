From: Edgar Toernig <froese@gmx.de>
Date: Fri, 06 Jan 2006 03:14:21 +0000
Subject: Re: [OT] ALSA userspace API complexity
Message-Id: <20060106041421.31579e69.froese@gmx.de>
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

Hannu Savolainen wrote:
>
> Takashi Iwai wrote:
> >
> > - Split of channels to concurrent accesses
>
> Could you be more specific with the above isues?

As I understand it: instead of providing one device with 5.1 capabilities
provide one device with 3 concurrent stereo users.  Reading the datasheet
of my AC'97 decoder (a cheap ALC650 connected to an ATIIXP) there is hard-
ware that supports this[1].

Sure, Alsa can do all of this and more in software - somehow ...

Ciao, ET.

[1] Unless the ATIIXP has some limitations - there are no docs 
    available :-(
