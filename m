From: Bill Nottingham <notting@redhat.com>
Date: Wed, 16 Sep 1998 01:39:17 +0000
Subject: Re: AWE64 initial questions
Message-Id: <marc-linux-sound-90591398514674@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90515879913606@msgid-missing>
In-Reply-To: <marc-linux-sound-90515879913606@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Dave Wreski (dave@nic.com) said: 
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

While I have no idea who this gentleman is you speak of...

sndconfig is more or less (for PnP cards) a wrapper that
reads the output of pnpdump and writes an isapnp.conf file.
Currently (i.e., the beta version in /pub/sound/sndconfig)
it recognizes SB, ESS, GUS, Ensoniq SoundScape,
CS4232 & (one) Turtle Beach PnP cards through a verrrry
simple algorithm. It takes advantage of the '--config' option
of pnpdump to attempt to autoconfigure PnP cards - this option
tells pnpdump to attempt to find nonconflicting values
(via looking at /proc/interrupts, etc.). What it notably *doesn't*
do is actually read the pnpdump output to determine the ranges
of settings to use; the choices available are hardcoded if the user
is inputting them. It probably should be changed to do this.
It also may not quite configure all the cards that it tries
to correctly, as we don't have all of them to test. :)

Yes, it does require the sound drivers from either a 2.1.late
kernel, or Alan's sound patches.

Of course, if anyone wants to use this as a base point for
a generic PnP configuration utility, they can. It certainly
isn't a particularly complicated program/idea; there's probably
quite a few ways to do the same thing.

Bill
