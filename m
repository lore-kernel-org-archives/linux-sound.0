From: Benno Senoner <sbenno@gardena.net>
Date: Fri, 29 Oct 1999 00:06:37 +0000
Subject: Re: Sync Issues (was Re: External MIDI Sync using OSS/Free)
Message-Id: <marc-linux-sound-94117721316350@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94097346918347@msgid-missing>
In-Reply-To: <marc-linux-sound-94097346918347@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Thu, 28 Oct 1999, Paul Barton-Davis wrote:
> 
> *smile* you've got a hardware problem. i know this because i have too :)
> 
> when i had to switch (temporarily) from my Matrix G200 AGP video card
                                                              ^^^^^^^^^^^
I didn't know that "The Matrix" was developed by Matrox.
:-)

> to an old ISA-based Diamond Speedstar, the performance of my audio
> stuff has gone down the tubes. i can't do *anything* with X and hope
> to not get dropouts. this never happened with the Matrox card, and i
> am very confident that as soon as Matrox ships me a new one, the
> problem will go away.
> 
> right now, my system is essentially useless for audio work unless you
> avoid using X. totally useless. i can't even play WAV files without
> *huge* dropouts, and thats on a *dual* PII-450 !

Yes,

the idiotproof test is the following:
install 2.2.10 + lowlatency patch  ( not SMP !), 
tune the IDE diskas as described in the README
and run a testsession
if the GFX stress graph is the only bad graph,
then I'm sorry but you have to throw away your videocard if you want
to do reliable low latency stuff.
:-)

Benno.
