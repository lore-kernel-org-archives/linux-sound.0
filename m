From: Miles Lane <miles@amazon.com>
Date: Tue, 26 Jan 1999 03:06:19 +0000
Subject: Re: Problem with cs4232.o
Message-Id: <marc-linux-sound-91731964100895@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91722163016425@msgid-missing>
In-Reply-To: <marc-linux-sound-91722163016425@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


Alan,

I checked into this.  When I boot the system,
the drivers load as I described earlier.
If I then attempt to run "esd" before starting X,
I get this error:

	Sound: DMA (output) timed out - IRQ/DRQ config error?

I get this error running as root or from my user account.

Also, after starting X, if I try running xgalaga, I either
get the "Cannot access /dev/dsp" or I get what sound like
a sequence of short sound loops that slowly mutate.

Weird.

Thanks for any help you can offer!

	Miles

On Mon, 25 Jan 1999, Alan Cox wrote:

> > The problem is that when I start up X, if I try to use the sound card
> > a get a popping sound from the speakers and STDERR shows a messages
> > stating that the program couldn't access /dev/dsp.  If I then run
> 
> That means its being used by something
> 
> > effect of loading Gnome, but I don't think so.
> 
> If you have esd running then yes
> 
> 
