From: Jaroslav Kysela <perex@suse.cz>
Date: Sun, 08 Jan 2006 13:32:40 +0000
Subject: Re: [OT] ALSA userspace API complexity
Message-Id: <Pine.LNX.4.61.0601081424560.10981@tm8103.perex-int.cz>
List-Id: <linux-sound.vger.kernel.org>
References: <20060104030034.6b780485.zaitcev@redhat.com>
 <Pine.LNX.4.61.0601041220450.9321@tm8103.perex-int.cz>
 <Pine.BSO.4.63.0601051253550.17086@rudy.mif.pg.gda.pl>
 <Pine.LNX.4.61.0601051305240.10350@tm8103.perex-int.cz>
 <Pine.BSO.4.63.0601051345100.17086@rudy.mif.pg.gda.pl> <s5hmziaird8.wl%tiwai@suse.de>
 <Pine.BSO.4.63.0601052022560.15077@rudy.mif.pg.gda.pl> <s5h8xtshzwk.wl%tiwai@suse.de>
 <20060108020335.GA26114@dspnet.fr.eu.org> <Pine.LNX.4.60.0601080317040.22583@kepler.fjfi.cvut.cz>
 <20060108132122.GB96834@dspnet.fr.eu.org>
In-Reply-To: <20060108132122.GB96834@dspnet.fr.eu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Olivier Galibert <galibert@pobox.com>
Cc: Martin Drab <drab@kepler.fjfi.cvut.cz>, Takashi Iwai <tiwai@suse.de>, ALSA development <alsa-devel@alsa-project.org>, linux-sound@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Sun, 8 Jan 2006, Olivier Galibert wrote:

> On Sun, Jan 08, 2006 at 03:26:18AM +0100, Martin Drab wrote:
> > On Sun, 8 Jan 2006, Olivier Galibert wrote:
> > 
> > > > And if the application doesn't support, who and where converts it?
> > > > With OSS API, it's a job of the kernel.
> > > 
> > > Once again no.  Nothing prevents the kernel to forward the data to
> > > userland daemons depending on a userspace-uploaded configuration.
> > 
> > I think that the point was, that switching from userspace to kernelspace 
> > then to userspace again and back to kernelspace in order to do something, 
> > that could have been done directly in the userspace, and though could save 
> > those two unnecessary switches, is an unnecessary overhead, which may not 
> > necessarily be that insignificant if it's done so often (which for 
> > streaming audio is the case).
> 
> You all seem to forget that dmix is in userspace in a different task
> too.

Because it is really not. The mixing is done directly to the mmaped DMA 
buffer.

> > Why doing things complicated when there is no evident gain from it,
> > or is there?
> 
> No evident gain?  Wow.  What about:
> - stopping crippling the OSS api

We're not doing that. We're just showing that OSS API and useability has 
it's own problems, too.

> - having a real kernel api for which you can make different libraries
>   depending on the need of the users
> 
> - stop making a fundamentally unsecure shared library mandatory

ALSA kernel API is real and binary compatible. If someone require to
write an own library, we will document this API, of course, too.

> - opening the possibility of writing plugins to people without a PhD
>   in lattice QCD.

Already done. We have official plugin SDK in alsa-lib to create user space 
drivers. If you have some questions or bug-reports (missing docs etc), 
please, fill a bug report.

Also, you can use very simple LADSPA plugin style, because alsa-lib can 
use LADSPA plugins directly, too.

						Jaroslav

-----
Jaroslav Kysela <perex@suse.cz>
Linux Kernel Sound Maintainer
ALSA Project, SUSE Labs
