From: Dan Hollis <goemon@sasami.anime.net>
Date: Thu, 10 Sep 1998 23:22:58 +0000
Subject: Re: AWE64 initial questions
Message-Id: <marc-linux-sound-90547658002396@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90515879913606@msgid-missing>
In-Reply-To: <marc-linux-sound-90515879913606@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Thu, 10 Sep 1998, Dave Wreski wrote:
> On 09-Sep-98 Dan Hollis wrote:
> > On Wed, 9 Sep 1998, Dave Wreski wrote:
> >> I think it's very important that sound works effortlessly on Linux.  The
> >> average Window's convert won't have the patience to go thru all these
> >> steps...
> > This is why isapnp under linux needs some serious work.
> > (Underscore, blink, neon lights, until SOMEONE gets the message).
> > Right now its not acceptable for isapnp to work better under doze95 than
> > linux. :-(
> I think what we need is a Linux Publicity Group, which serves to make the
> companies aware of just what functionality is currently available.  In other
> words, inform the sound manufacturers of our current "Proof of Concept".  It is
> in fact possible to produce sound on Linux, and the board can work correctly if
> a full-blown driver was written for it..

This isnt going to help.

The fundamental problem is a lack of proper isapnp support in the linux
kernel itself. Until this gets fixed, nothing is going to work right.

Right now getting isapnp devices working under linux is an evil mess.

-Dan
