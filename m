From: Marcus Brinkmann <Marcus.Brinkmann@ruhr-uni-bochum.de>
Date: Mon, 28 Sep 1998 23:39:46 +0000
Subject: Re: Was: Re: SB32 Problem (fwd) now AWE32 micro-howto
Message-Id: <marc-linux-sound-90703420404941@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90696059008619@msgid-missing>
In-Reply-To: <marc-linux-sound-90696059008619@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Mon, Sep 28, 1998 at 12:13:06AM -0500, Raymond Hall wrote:
> 
> 1- I assume you're initializing the card via isapnptools at boot...
> There's one caveat though: pnpdump fails to detect all the 3 ioports to
> the wavetable (...er, I'm talking AWE here, but maybe it's the same)
> So check your pnpconfig, in the wavetable section it SHOULD init 3
> ioports, in my case they're: (ymmv)
> 
> 	(CONFIGURE CTL0039/23833 (LD 2
> 	(IO 0 (BASE 0x0620))
> 	(IO 1 (BASE 0x0A20))   <---\___ add these lines.
> 	(IO 2 (BASE 0x0E20))   <---/
> 	(ACT Y)
> 	))

This is laready mentioned in my howto.
 
> 2- You have to insmod the modules in proper order, preferably insmoding
> sound.o at boot time (DMA buffer space allocation gets scarce), and the
> rest whenever you like. I have sound.o insmoded in rc.local, and a script
> called sound, as follows:

[snipped]

Thank you for the additional information about the new kernel releases. I
have more information in my archive, but didn't come to update my Howto. I
promise that it'll be done at the time 2.2.x kernels come out.

> 3- Finally, to hear anything from the wavetable, you've got to upload some
> samples to it (i.e. sfbanks, either *.sbk or *.sf2), for which theres a
> beautifull utility called sfxload available at your nearest bahamut
> mirror.(guess there's a rpm @ redhat too)

Yep, it's in my howto, too.

Thank you,
Marcus

-- 
"Rhubarb is no Egyptian god."        Debian GNU/Linux        finger brinkmd@ 
Marcus Brinkmann                   http://www.debian.org    master.debian.org
Marcus.Brinkmann@ruhr-uni-bochum.de                        for public  PGP Key
http://homepage.ruhr-uni-bochum.de/Marcus.Brinkmann/       PGP Key ID 36E7CD09
