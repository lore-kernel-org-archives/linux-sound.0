From: Jonathan Masters <mastersj@periscope-systems.freeserve.co.uk>
Date: Thu, 19 Aug 1999 01:51:07 +0000
Subject: Re: Multiple sbs with module
Message-Id: <marc-linux-sound-93502746730035@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93502551628718@msgid-missing>
In-Reply-To: <marc-linux-sound-93502551628718@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Nope. It doesn't work. Apparantly "io=" can only take one value, so that isn't the
solution. Someone else suggested ALSA, but I prefer to use the standard linux
sound drivers. OK, I'm not aksing for a flame war here about which is better, so
please don't start one on my account, however, I'd prefer it if someone had a oss
solution for me.

Thanx all.

Jon.

Dave Mielke wrote:

> On Thu, 19 Aug 1999, Jonathan Masters wrote:
> >I now wish to have *2* sb's with the same module. This
> >would be trivially easy with the code in the kernel (simply setting
> >SB2_BASE et al), but I must have it in the module. Can this be achieved?
>
> I don't have two sound cards, so I can't test it, but you should be able to do
> something like this (in conf.modules):
>
>     options sb irq=5,6 io=0x100,0x200 dma=1,2
>
> In other words, for each option, give a comma-delimited list of values. The
> first value in each list is for the first card, the second for the second, etc.
>
> --
> Dave Mielke           | 856 Grenon Avenue | I believe that the Bible is the
> Phone: 1-613-726-0014 | Ottawa, Ontario   | Word of God. Please contact me
> EMail: dave@mielke.cc | Canada  K2B 6G3   | if you're concerned about Hell.

--
Jonathan C. Masters (jonathan@oxlug.org) PGP: www.brookes.ac.uk/~95227860/KEY

"Upon this rock I will build my church
and the gates of hell shall not prevail against it". -- Matthew 16, 17-18
