From: Trevor Johnston <trevor@drogheda.edunet.ie>
Date: Mon, 14 Jun 1999 23:44:49 +0000
Subject: Free OSS Problems
Message-Id: <marc-linux-sound-92940355631769@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hello,
I have just joined this list and am not sure if this sort of request is
common or not, though I suspect it is. My name is Trevor Johnston, and
I'm living in Ireland with a locally built Cyrix 6Mx86 233Mhz machine
with 64Mb of memory (2 32Mb chips) and I have a highly unusual problem
with sound cards on my computer.

Since I first installed Linux last October I have had major problems
with Linux (in general) on my machine; the majority of these were only
recently traced to overheating of the CPU; my cover is now removed from
the machine and an enormous CPU fan installed. But now I have problems
with my soundcard...

I had a Yamaha OPL-SAx card, for which I obtained the Linux kernel 2.2.2
running under Redhat 5.2. Using isapnptools I tried a multitude of
resource settings with this same result - the machine would invariably
crash after a random period of time, usually when running X. Thinking
the card to simply be incompatible with Linux I got a Genius Sound Maker
3DX2 which has a Crystal CS4236 chip.

This was great for a while and worked with kernel 2.0.36 (Redhat 5.2
default). But wen I tried to record (using two different programs) the
system crashed almost straight away! All is not lost, though - the trial
version of the commercial OSS drivers appear very impressive indeed and
installed the card (apparently) perfectly and can now play and record
without problems. However, even with commercial OSS I get a message
saying:
"AD1848: Interrupt test failed (IRQ7)"
but the system appears stable, despite the fact that I get the same
message with the free drivers. Incidentally, commercial OSS uses
completely different resource settings to Windows 95. I tried these
settings with free OSS, but no luck, whether running X or not.

The fact that commercial OSS works would seem to lessen the likelihood
that I have dud hardware, especially considering that I now work for the
local shop I purchased my computer from and who have been exceptionally
helpful, even going so far as to donate me the Crystal sound card.

The best solution would probably be to simply buy commercial OSS, but I
really would prefer to go the free route (not because I'm cheap or
anything - commercial OSS is very impressive indeed -, I just think free
software is a good idea); I am no novice with computers and am an
amatuer C programmer who doesn't mind experimenting with drivers (in
fact I sort of enjoy it, in small doses).

But this situation has tried my patience - apologies is this letter is
far
too long, but I imagine this is a highly unusual situation. If anyone
can offer advise on these problems and could offer solutions on getting
either card to work (preferably the Yamaha) I would really, really
appreciate it. This is the only computer problem that has ever stumped
me and caused me this much hassle.

Thank you in advance,
Trevor Johnston
