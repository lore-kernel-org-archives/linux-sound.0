From: Adrian Bunk <bunk@stusta.de>
Date: Tue, 03 Jan 2006 23:10:09 +0000
Subject: Re: [2.6 patch] schedule obsolete OSS drivers for removal
Message-Id: <20060103231009.GI3831@stusta.de>
List-Id: <linux-sound.vger.kernel.org>
References: <200601031522.06898.s0348365@sms.ed.ac.uk> <20060103160502.GB5262@irc.pl> <200601031629.21765.s0348365@sms.ed.ac.uk> <20060103170316.GA12249@dspnet.fr.eu.org> <s5h1wzpnjrx.wl%tiwai@suse.de> <20060103203732.GF5262@irc.pl> <s5hvex1m472.wl%tiwai@suse.de> <9a8748490601031256x916bddav794fecdcf263fb55@mail.gmail.com> <20060103215654.GH3831@stusta.de> <20060103221314.GB23175@irc.pl>
In-Reply-To: <20060103221314.GB23175@irc.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jesper Juhl <jesper.juhl@gmail.com>, Takashi Iwai <tiwai@suse.de>, Olivier Galibert <galibert@pobox.com>, Alistair John Strachan <s0348365@sms.ed.ac.uk>, Jan Engelhardt <jengelh@linux01.gwdg.de>, Andi Kleen <ak@suse.de>, perex@suse.cz, alsa-devel@alsa-project.org, James@superbug.demon.co.uk, sailer@ife.ee.ethz.ch, linux-sound@vger.kernel.org, zab@zabbo.net, kyle@parisc-linux.org, parisc-linux@lists.parisc-linux.org, jgarzik@pobox.com, Thorsten Knabe <linux@thorsten-knabe.de>, zwane@commfireservices.com, zaitcev@yahoo.com, linux-kernel@vger.kernel.org

On Tue, Jan 03, 2006 at 11:13:14PM +0100, Tomasz Torcz wrote:
> On Tue, Jan 03, 2006 at 10:56:54PM +0100, Adrian Bunk wrote:
> > > > > > Well, we keep the compatibility exactly -- OSS drivers don't support
> > > > > > software mixing in the kernel, too :)
> > > > >
> > > > >  OSS will support software mixing. In kernel. On NetBSD.
> > > > > http://kerneltrap.org/node/4388
> > > >
> > > > Why do we need to keep the compatibility with NetBSD?
> > > >
> > > Software mixing is a really nice feature for people with soundscards
> > > that can't do hardware mixing, so if the OSS compatibility could
> > > transparently do software mixing for apps using OSS api that would be
> > > a very nice extension for a lot of people - I'd say that if NetBSD do
> > > that they've got the right idea.
> > 
> > The OSS compatibility in ALSA is only a legacy API for applications not 
> > yet converted to use the ALSA API.
> 
>   OSS is universal cross-unix API. ALSA is Linux-only.

How "universal cross-unix" is the OSS API really?

Which operating systems besides Linux have a native sound system 
supporting the OSS API [1]?

I know about FreeBSD and partial support in NetBSD.

Are there any other [2]?

cu
Adrian

[1] I'm not talking about a port of the commercial OSS to the operating
    system which has little value for application developers.
[2] This is not a rhetorical question, I simply don't know about any 
    other.

-- 

       "Is there not promise of rain?" Ling Tan asked suddenly out
        of the darkness. There had been need of rain for many days.
       "Only a promise," Lao Er said.
                                       Pearl S. Buck - Dragon Seed

