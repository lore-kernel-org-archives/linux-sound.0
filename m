From: <rtlynch@aracnet.com>
Date: Tue, 15 Sep 1998 15:14:22 +0000
Subject: Re: AWE64 initial questions
Message-Id: <marc-linux-sound-90590948413161@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90515879913606@msgid-missing>
In-Reply-To: <marc-linux-sound-90515879913606@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Just this last weekend I was looking at the source code for sndconfig.  As
far as the probing sound cards go, sndconfig just runs pnpdump and then
parses through the output looking for sound blaster entries. If there are
no sound blaster entries then your out of luck.  Adding other sound cards
doesn't look like it would be to hard to do.

Although, I found that my CS4236B ANSI entries from pnpdump has a nasty
habit of sticking a null on the end.  When sndconfig parses through the
pnpdump output, it dumps out as soon as it comes across the CS4236B entry.
Has anyone else seen pnp sound cards that stick null's within pnpdump's
output? 

On Mon, 14 Sep 1998, Dave Wreski wrote:

> 
> > > Guys, while I think this is a good idea, and something that surely can help a
> > > lot of people, perhaps your efforts would be better applied if you focused on
> > > the sndconfig utility that already has a moderately-working implementation.
> > 
> > Enlighten us, then.  What is sndconfig and where can we find a copy?
> 
> Check out:
> 
> ftp://ftp.redhat.com/pub/sound/sndconfig
> 
> It seems to be able to probe your system for PnP sound cards.  Actually,
> I'm not sure if it's capable of probing for more than just SB cards.
> Also, I think it's configured to use the new sound modules available in
> the development kernels, and a patch to 2.0.35.
> 
> Perhaps the gentleman from RH can respond?
> 
> Dave
> 
> 
