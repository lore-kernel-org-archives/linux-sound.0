From: Hamish Moffatt <moffatt@cs.rmit.edu.au>
Date: Fri, 11 Sep 1998 09:31:52 +0000
Subject: Re: AWE64 initial questions
Message-Id: <marc-linux-sound-90550687211014@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90515879913606@msgid-missing>
In-Reply-To: <marc-linux-sound-90515879913606@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Wed, Sep 09, 1998 at 03:13:09PM -0700, Dan Hollis wrote:
> On Wed, 9 Sep 1998, Dave Wreski wrote:
> > I think it's very important that sound works effortlessly on Linux.  The
> > average Window's convert won't have the patience to go thru all these
> > steps...
> 
> This is why isapnp under linux needs some serious work.
> (Underscore, blink, neon lights, until SOMEONE gets the message).
> 
> Right now its not acceptable for isapnp to work better under doze95 than
> linux. :-(

What's wrong with isapnptools? Works fine for me. Setting up /etc/isapnp.conf
is a bit harder than letting Windows do it for you, but Linux is general
requires more intelligence than 95/98 at present. As a result, you get
more flexibility; isapnp doesn't care where you stick your hardware, while 
Windows will do everything it can to stop you manually allocating machine
resources.

To me, Linux uses isapnp just like software setup of ethernet cards; it lets
me pick where to put hardware without changing jumpers, rather than allocating
it where it THINKS it fits.


Hamish
-- 
Hamish Moffatt, StudIEAust              hamish@debian.org, hamish@moffatt.nu
Student, computer science & computer systems engineering.    4th year, RMIT.
http://hamish.home.ml.org/ (PGP key here)             CPOM: [*******   ] 73%
"Note that in C++, as in life, friendship is not transitive" -- TC++3 manual
