From: Peter Leif Rasmussen <plr@cedara.com>
Date: Mon, 03 Apr 2000 14:49:07 +0000
Subject: Recording with SB16?
Message-Id: <marc-linux-sound-95480596808537@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

I have a SB16 (non Vibra) card that I yesterday attempted to record with,
both through the mike and line input, using wavrec/wavplay and sox (with 
the rec and play frontends).

I could get some faint recording through the mike input, but I wasn't
able to get anything properly through the line input, even though the
sound from there would go clearly to the speakers connected to the speaker
output.

Running sox with the 'stat' option sowed that there was no input and that
volume would have to be set to 'inf'. Putting the line signal I had through
the mike (disconnecting the speakers first :-) gave a very faint, but also
very distorted recording. Using sox with 'stat' this time said the volume
would have to be set to 14, which I did. A lot of distortion as I would
have expected.

It therefore looks like something is not right, but I can't figure out
what? I just want something as simple as possible to record from the mike
and line inputs, preferably being able to mix the two.

I'm using linux-2.3.99-pre3, but also tried it with 2.3.33 that was at
hand, with the same result. Otherwise it is an almost stock Slackware 7.0
on a P133.

Thanks for any input,

Peter
