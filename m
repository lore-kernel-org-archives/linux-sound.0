From: Martin Drab <drab@kepler.fjfi.cvut.cz>
Date: Sun, 08 Jan 2006 02:26:18 +0000
Subject: Re: [OT] ALSA userspace API complexity
Message-Id: <Pine.LNX.4.60.0601080317040.22583@kepler.fjfi.cvut.cz>
List-Id: <linux-sound.vger.kernel.org>
References: <Pine.BSO.4.63.0601032210380.29027@rudy.mif.pg.gda.pl>
 <mailman.1136368805.14661.linux-kernel2news@redhat.com>
 <20060104030034.6b780485.zaitcev@redhat.com> <Pine.LNX.4.61.0601041220450.9321@tm8103.perex-int.cz>
 <Pine.BSO.4.63.0601051253550.17086@rudy.mif.pg.gda.pl>
 <Pine.LNX.4.61.0601051305240.10350@tm8103.perex-int.cz>
 <Pine.BSO.4.63.0601051345100.17086@rudy.mif.pg.gda.pl> <s5hmziaird8.wl%tiwai@suse.de>
 <Pine.BSO.4.63.0601052022560.15077@rudy.mif.pg.gda.pl> <s5h8xtshzwk.wl%tiwai@suse.de>
 <20060108020335.GA26114@dspnet.fr.eu.org>
In-Reply-To: <20060108020335.GA26114@dspnet.fr.eu.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Olivier Galibert <galibert@pobox.com>
Cc: Takashi Iwai <tiwai@suse.de>, ALSA development <alsa-devel@alsa-project.org>, linux-sound@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Sun, 8 Jan 2006, Olivier Galibert wrote:

> > And if the application doesn't support, who and where converts it?
> > With OSS API, it's a job of the kernel.
> 
> Once again no.  Nothing prevents the kernel to forward the data to
> userland daemons depending on a userspace-uploaded configuration.

I think that the point was, that switching from userspace to kernelspace 
then to userspace again and back to kernelspace in order to do something, 
that could have been done directly in the userspace, and though could save 
those two unnecessary switches, is an unnecessary overhead, which may not 
necessarily be that insignificant if it's done so often (which for 
streaming audio is the case). Why doing things complicated when there is 
no evident gain from it, or is there?

Martin
