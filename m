From: Dave Wreski <dave@nic.com>
Date: Mon, 14 Sep 1998 20:09:04 +0000
Subject: Re: AWE64 initial questions
Message-Id: <marc-linux-sound-90581235306813@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90515879913606@msgid-missing>
In-Reply-To: <marc-linux-sound-90515879913606@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


> > Guys, while I think this is a good idea, and something that surely can help a
> > lot of people, perhaps your efforts would be better applied if you focused on
> > the sndconfig utility that already has a moderately-working implementation.
> 
> Enlighten us, then.  What is sndconfig and where can we find a copy?

Check out:

ftp://ftp.redhat.com/pub/sound/sndconfig

It seems to be able to probe your system for PnP sound cards.  Actually,
I'm not sure if it's capable of probing for more than just SB cards.
Also, I think it's configured to use the new sound modules available in
the development kernels, and a patch to 2.0.35.

Perhaps the gentleman from RH can respond?

Dave
