From: "Ravi K. Swamy" <rks@rtp.mea.com>
Date: Mon, 01 Nov 1999 15:33:29 +0000
Subject: Re: Problem with ESS Solo1
Message-Id: <marc-linux-sound-94147611431932@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94131439128758@msgid-missing>
In-Reply-To: <marc-linux-sound-94131439128758@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Mon, 1 Nov 1999, Thomas Sailer wrote:

> > When playing realaudio files with the new g2 player it sounds like the
> > sound is played back 1000 times faster than it should be, none of the
> 
> It looks like it's the same thing as with the older real players that's
> documented in Documentation/Changes. So you either need to find
> the place to patch g2 or use the LD_PRELOAD trick...
> 
> Tom

I have seen the bug in the old real players and this is nothing like the
previous one.  The old bug was that the sound would play *normally* and
then all of a sudden stop.  What I am seeing is nothing at all like the
old bug.  The old bug is described quite well at
http://onramp.i2k.com/~jeffd/rpopen/  but this problem I am seeing seems
to be very specific to the ESS Solo1 card.  The G2 player and Unreal Tournament
work fine on my old SB 32, Ensoniq 1371, and ESS 16xx.

Ravi
