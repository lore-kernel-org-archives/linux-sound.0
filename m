From: Tony Nugent <Tony.Nugent@usq.edu.au>
Date: Sun, 29 Nov 1998 08:37:19 +0000
Subject: Re: sound driver for Dell Latitude CP (and other laptops)
Message-Id: <marc-linux-sound-91234034027434@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91182489707241@msgid-missing>
In-Reply-To: <marc-linux-sound-91182489707241@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Sat Nov 28 1998 at 21:19, Derrick J Brashear wrote:

> I have a Dell Latitude CPi; Based on what you said I assume the audio is
> the same. I'm ucrrently using ALSA with the following configuration:
> add to /etc/conf.modules:

I'm using a RedHat 5.2 installation, with it's (original) pre-0.7 2.0.36
kernel.

None of this worked :-(

> alias snd-card-0 snd-card-cs4232

I don't have any modules called snd-<anything> but I do have a module
called cs4232.o

Which I tried.  I had to pre-load some other modules, then insmod the
cs4232 driver giving it io/dma/dma2/irq values.

Thanks to all the clues... it worked!   :-)

Many thanks for this invaluable help in pointing me in the right
direction... it's very nice to have some noise come out of this neat little
box :-)

I can only assume that this "ALSA" you mention is the OSS driver?

BTW, I've done all this from the command line.  When I get
/etc/conf.modules tweaked rignt to get it working, I'll post the results
here.

Surely this would be useful in an FAQ or some sort of home page devoted to
configuring laptops?  (Can someone point me in a good direction to post
this info to?)

Cheers
Tony
 -=*#*=-=*#*=-=*#*=-=*#*=-=*#*=-=*#*=-=*#*=-=*#*=-=*#*=-=*#*=-=*#*=-
  Tony Nugent <Tony.Nugent@usq.edu.au>           <linux@usq.edu.au>
  Computer Systems Officer                       Faculty of Science
  University of Southern Queensland, Toowoomba Oueensland Australia
 -=*#*=-=*#*=-=*#*=-=*#*=-=*#*=-=*#*=-=*#*=-=*#*=-=*#*=-=*#*=-=*#*=-
