From: Britton <fsblk@aurora.uaf.edu>
Date: Tue, 04 Apr 2000 17:32:29 +0000
Subject: Re: Recording with SB16?
Message-Id: <marc-linux-sound-95486986122098@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95480596808537@msgid-missing>
In-Reply-To: <marc-linux-sound-95480596808537@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


sox rec and play seem to introduce lots of noise under the best of
circumstances; without changing any wiring or mixer settings I get much
better quality from brec/bplay (which uses sys V ipc and multiple
processes do simultaneous write between audio device and memory and
between memory and disk).  brec/bplay is old, apparently unmaintained, and
buggy (not all the options work as expected, or indeed at all, for raw
sound data for example) but quite functional.  In addition, there is a
relatively new package call yarec (yet another recorder) which seems to be
trying to pick up where brec left off, though it omits some (theoreticly
useful) bplay options.  I myselft will soon be putting out an alpha
release of a program I intend to call rawrec, which will only deal in raw
audio, but with many options to control recording, if by any chance you
would like to take a look at it I could send it to you.

Britton Kerin
__
GNU GPL: "The Source will be with you... always."

On Mon, 3 Apr 2000, Peter Leif Rasmussen wrote:

> I have a SB16 (non Vibra) card that I yesterday attempted to record with,
> both through the mike and line input, using wavrec/wavplay and sox (with 
> the rec and play frontends).
> 
> I could get some faint recording through the mike input, but I wasn't
> able to get anything properly through the line input, even though the
> sound from there would go clearly to the speakers connected to the speaker
> output.
> 
> Running sox with the 'stat' option sowed that there was no input and that
> volume would have to be set to 'inf'. Putting the line signal I had through
> the mike (disconnecting the speakers first :-) gave a very faint, but also
> very distorted recording. Using sox with 'stat' this time said the volume
> would have to be set to 14, which I did. A lot of distortion as I would
> have expected.
> 
> It therefore looks like something is not right, but I can't figure out
> what? I just want something as simple as possible to record from the mike
> and line inputs, preferably being able to mix the two.
> 
> I'm using linux-2.3.99-pre3, but also tried it with 2.3.33 that was at
> hand, with the same result. Otherwise it is an almost stock Slackware 7.0
> on a P133.
> 
> Thanks for any input,
> 
> Peter
> 
> 
