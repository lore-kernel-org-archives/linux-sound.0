From: Hamish Moffatt <moffatt@cs.rmit.edu.au>
Date: Sat, 19 Sep 1998 12:59:42 +0000
Subject: Re: AWE64 initial questions
Message-Id: <marc-linux-sound-90620973826420@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90515879913606@msgid-missing>
In-Reply-To: <marc-linux-sound-90515879913606@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Mon, Sep 14, 1998 at 04:09:04PM -0400, Dave Wreski wrote:
> > > Guys, while I think this is a good idea, and something that surely can help a
> > > lot of people, perhaps your efforts would be better applied if you focused on
> > > the sndconfig utility that already has a moderately-working implementation.
> Check out:
> ftp://ftp.redhat.com/pub/sound/sndconfig
> 
> It seems to be able to probe your system for PnP sound cards.  Actually,
> I'm not sure if it's capable of probing for more than just SB cards.
> Also, I think it's configured to use the new sound modules available in
> the development kernels, and a patch to 2.0.35.

But that's sound configuration -- I think we are talking about
a generic PnP utility to handle sound, modems, network cards etc.
I certainly was.

Last time I looked at sndconfig (a while back) it did not use
the new sound modules, but some Redhat-specific sound modularization
patches. Hence it did not work for me on my Debian system; otherwise
we would probably have a Debian package of it.


Hamish
-- 
Hamish Moffatt, StudIEAust              hamish@debian.org, hamish@moffatt.nu
Student, computer science & computer systems engineering.    4th year, RMIT.
http://hamish.home.ml.org/ (PGP key here)             CPOM: [*******   ] 73%
"Note that in C++, as in life, friendship is not transitive" -- TC++3 manual
