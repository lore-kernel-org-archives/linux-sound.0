From: "paco@hydrofunk.org" <paco@hydrofunk.org>
Date: Tue, 20 Jun 2000 22:40:31 +0000
Subject: Re: [linux-audio-dev] Re: Multimedia compression
Message-Id: <marc-linux-sound-96200429928837@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-96126686903146@msgid-missing>
In-Reply-To: <marc-linux-sound-96126686903146@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


On Tue, 20 Jun 2000, Dustin Barlow wrote:

> to audio CDR or wav file prior to listening.  I haven't found a streaming
> version of Shorten for linux, so I grabbed the source code the other day
> and am looking into what it would take to do it...shouldn't be to difficult.




Hey... this is fairly new.  Somebody hacked XMMS so that it plays SHN
files directly.  The relevant info is in the text below.

Note that you can also do this:

     paco@hydrofunk.org%> shorten -x <file>.shn - | play -t wav -

from the command line to play a SHN without making the intermediate .WAV
file.  It works fine, but you don't get a nice GUI or the ability to
pause, ffwd, or rewind the audio.

I ahven't checked out the hacked XMMS yet, but it's the talk of the town
on www.etree.org.  


>i386 RPMs and their SRPM are available at:
>
>http://phishphry.hagopian.net/
>
>If anyone wants to build it from the SRPM for other architectures but
>doesn't have a spot to host it I can swing that - contact me off the
list.
>                                                               -Rob
>
>On Mon, 19 Jun 2000, jason wrote:
>
> >
> > [I've been waiting to release this for nearly a week, due to outgoing 
>mail
> > being disabled here.  Which was probably good, since I ran into a
minor
> > problem with the initial release that was easily corrected.  I also 
>wanted
> > to wait until XMMS 1.2.1 was released (which it was just a few moments
> > ago), to ensure compatibility and avoid any possible confusion.]
> >
> > 
>-------------------------------------------------------------------------
> >
> >
> > Hey *nix folks,
> >
> >   I've hacked XMMS to support the playback of .shn files directly from 
>the
> > hard drive, perfect for those with little disk space or patience.  :-)
> > All the info you need is here:
> >
> >   http://sdf.lonestar.org/~jason/xmms-shn/
> >
> > Feedback is welcome.  Enjoy!
> >
> > -jason
> >
> > --------------------------- [ etree@etree.org ] 
