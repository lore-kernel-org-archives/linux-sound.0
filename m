From: Hamish Moffatt <moffatt@cs.rmit.edu.au>
Date: Fri, 11 Sep 1998 09:29:13 +0000
Subject: Re: AWE64 initial questions
Message-Id: <marc-linux-sound-90550687111011@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90515879913606@msgid-missing>
In-Reply-To: <marc-linux-sound-90515879913606@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Wed, Sep 09, 1998 at 05:03:35PM +0200, Juan Lupion wrote:
> > After using 'isapnp /etc/isapnp.conf', how can I tell it worked?  It didn't
> > complain, but there was also no information available in the normal /proc files,
> > such as /proc/{interrupts,dma,ioports} etc..  Should there be, or only after the
> > sound module is installed?
> 
> I f*cked my isapnp.conf config using RedHat's sndconfig. If it

Even worse, sndconfig (at least the version I tried last) is aimed
at using Red Hat-specific sound modularization patches. This give different
module names & parameters than the stuff in Linux 2.1 or the stuff
in OSS/Linux (the commercial sound driver).


Hamish
-- 
Hamish Moffatt, StudIEAust              hamish@debian.org, hamish@moffatt.nu
Student, computer science & computer systems engineering.    4th year, RMIT.
http://hamish.home.ml.org/ (PGP key here)             CPOM: [*******   ] 73%
Get a stable, reliable &  upgradable operating system free at www.debian.org
