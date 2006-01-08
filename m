From: Olivier Galibert <galibert@pobox.com>
Date: Sun, 08 Jan 2006 13:04:47 +0000
Subject: Re: [OT] ALSA userspace API complexity
Message-Id: <20060108130447.GA96834@dspnet.fr.eu.org>
List-Id: <linux-sound.vger.kernel.org>
References: <20060104030034.6b780485.zaitcev@redhat.com> <Pine.LNX.4.61.0601041220450.9321@tm8103.perex-int.cz> <Pine.BSO.4.63.0601051253550.17086@rudy.mif.pg.gda.pl> <Pine.LNX.4.61.0601051305240.10350@tm8103.perex-int.cz> <Pine.BSO.4.63.0601051345100.17086@rudy.mif.pg.gda.pl> <s5hmziaird8.wl%tiwai@suse.de> <Pine.BSO.4.63.0601052022560.15077@rudy.mif.pg.gda.pl> <s5h8xtshzwk.wl%tiwai@suse.de> <20060108020335.GA26114@dspnet.fr.eu.org> <Pine.LNX.4.61.0601081039520.9470@tm8103.perex-int.cz>
In-Reply-To: <Pine.LNX.4.61.0601081039520.9470@tm8103.perex-int.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jaroslav Kysela <perex@suse.cz>
Cc: Takashi Iwai <tiwai@suse.de>, ALSA development <alsa-devel@alsa-project.org>, linux-sound@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Sun, Jan 08, 2006 at 10:42:02AM +0100, Jaroslav Kysela wrote:
> On Sun, 8 Jan 2006, Olivier Galibert wrote:
> 
> > On Sat, Jan 07, 2006 at 03:32:27PM +0100, Takashi Iwai wrote:
> > > Yes, it's a known problem to be fixed.  But, it's no excuse to do
> > > _everything_ in the kernel (which OSS requires).
> > 
> > OSS does not require to do anything in the kernel except an entry
> > point.
> > 
> > 
> > > And if the application doesn't support, who and where converts it?
> > > With OSS API, it's a job of the kernel.
> > 
> > Once again no.  Nothing prevents the kernel to forward the data to
> > userland daemons depending on a userspace-uploaded configuration.
> 
> But it's quite ineffecient. The kernel must switch tasks at least twice
> or more. It's the major problem with the current OSS API.

Once.  U->K or K->U is not task switching and accordingly has a very
low cost.  It's changing of userspace task that is costly.  And dmix
_is_ a task switch, there is no performance difference between talking
with it through shared memory and semaphores and who knows what else
and talking with it through a kernel interface.

You should count how many U-U switches and U-K syscalls communicating
with dmix represents.  Hard to do for a simple user, since the
protocol is not documented.

  OG.

