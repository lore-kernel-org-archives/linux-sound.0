From: Billy Biggs <vektor@DIV8.NET>
Date: Wed, 27 Oct 1999 18:55:29 +0000
Subject: Re: HZ > 100 overhead
Message-Id: <marc-linux-sound-94105121607896@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94104909204283@msgid-missing>
In-Reply-To: <marc-linux-sound-94104909204283@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Wed, 27 Oct 1999 est@hyperreal.org wrote:

> Paul Barton-Davis discourseth:
> > >
> > >Wouldn't you say that an HZ > 100 kernel is the cleanest solution?
> > 
> > its the cleanest, but not the best. HZ = 1000 adds about 8% overhead
> > to IRQ processing *all the time*.
> 
> Are you *sure* about this?  I seem to remember there was some debate
> about that figure on linux-kernel.

  Just to add to the confusion, I remember that this only adds significant
overhead on older machines.  Regardless, a higher HZ value should be
standard, and switching back to a lower one (100) should be simply a
kernel config option.

  This is all pretty controversial though.

  #demoscene on irc.openprojects.net for people who support this idea. :)
  #linux on linuxnet for some people who don't support this idea. :)

--
Billy Biggs                         vektor@div8.net
http://www.div8.net/billy       wbiggs@uwaterloo.ca
