From: Jesper Juhl <jesper.juhl@gmail.com>
Date: Tue, 03 Jan 2006 20:56:20 +0000
Subject: Re: [2.6 patch] schedule obsolete OSS drivers for removal
Message-Id: <9a8748490601031256x916bddav794fecdcf263fb55@mail.gmail.com>
List-Id: <linux-sound.vger.kernel.org>
References: <20050726150837.GT3160@stusta.de>
	 <200601031522.06898.s0348365@sms.ed.ac.uk>
	 <20060103160502.GB5262@irc.pl>
	 <200601031629.21765.s0348365@sms.ed.ac.uk>
	 <20060103170316.GA12249@dspnet.fr.eu.org>
	 <s5h1wzpnjrx.wl%tiwai@suse.de> <20060103203732.GF5262@irc.pl>
	 <s5hvex1m472.wl%tiwai@suse.de>
In-Reply-To: <s5hvex1m472.wl%tiwai@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Takashi Iwai <tiwai@suse.de>
Cc: Tomasz Torcz <zdzichu@irc.pl>, Olivier Galibert <galibert@pobox.com>, Alistair John Strachan <s0348365@sms.ed.ac.uk>, Jan Engelhardt <jengelh@linux01.gwdg.de>, Andi Kleen <ak@suse.de>, Adrian Bunk <bunk@stusta.de>, perex@suse.cz, alsa-devel@alsa-project.org, James@superbug.demon.co.uk, sailer@ife.ee.ethz.ch, linux-sound@vger.kernel.org, zab@zabbo.net, kyle@parisc-linux.org, parisc-linux@lists.parisc-linux.org, jgarzik@pobox.com, Thorsten Knabe <linux@thorsten-knabe.de>, zwane@commfireservices.com, zaitcev@yahoo.com, linux-kernel@vger.kernel.org

On 1/3/06, Takashi Iwai <tiwai@suse.de> wrote:
> At Tue, 3 Jan 2006 21:37:32 +0100,
> Tomasz Torcz wrote:
> >
> > On Tue, Jan 03, 2006 at 09:22:58PM +0100, Takashi Iwai wrote:
> > > At Tue, 3 Jan 2006 18:03:16 +0100,
> > > Olivier Galibert wrote:
> > > >
> > > > > This is exactly why the OSS emulation option in ALSA is really a last resort
> > > > > and should not be an excuse for people to ignore implementing ALSA support
> > > > > directly. More so, it is very good justification for ditching "everything
> > > > > OSS" as soon as possible, at least in new software.
> > > >
> > > > Actually the crappy state of OSS emulation is a good reason to ditch
> > > > ALSA in its current implementation.  As Linus reminded not so long
> > > > ago, backwards compatibility is extremely important.
> > >
> > > Well, we keep the compatibility exactly -- OSS drivers don't support
> > > software mixing in the kernel, too :)
> >
> >  OSS will support software mixing. In kernel. On NetBSD.
> > http://kerneltrap.org/node/4388
>
> Why do we need to keep the compatibility with NetBSD?
>
Software mixing is a really nice feature for people with soundscards
that can't do hardware mixing, so if the OSS compatibility could
transparently do software mixing for apps using OSS api that would be
a very nice extension for a lot of people - I'd say that if NetBSD do
that they've got the right idea.

--
Jesper Juhl <jesper.juhl@gmail.com>
Don't top-post  http://www.catb.org/~esr/jargon/html/T/top-post.html
Plain text mails only, please      http://www.expita.com/nomime.html
