From: Kevin Turner <Kevin.Turner@oberlin.edu>
Date: Sat, 16 Jan 1999 18:43:35 +0000
Subject: Re: ESS ES1689 OSS/Free help needed
Message-Id: <marc-linux-sound-91651260528988@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91650730927120@msgid-missing>
In-Reply-To: <marc-linux-sound-91650730927120@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Sat, Jan 16, 1999 at 06:19:04PM +0100, Jacek M. Holeczek wrote:
> my card as ES1868 ( not bad ), then it modifies the /etc/conf.modules
> required modules and the /etc/sndconfig looks well, but ... it doesn't
> really work :
> 	1. "cat sample.au > /dev/audio" works
> 	2. "cat something.wav > /dev/dsp" produces terrible noise, just
> 	   like I was doing "cat something.wav > /dev/audio", or "cat
> 	   something.au > /dev/dsp"

This is often true under working systems.  You need a wav player to
really play wavs...  It does something a bit more sophisticated than 'cat'.

> 	3. "dd bs=8k count=4 < /dev/audio > sample.au" works, I can also
> 	4. "dd bs=8k count=4 < /dev/dsp > sample.wav" works, I can also
> 	5. none of recored samples ( from points 3. and 4. ) is in correct

Again, some software is useful here.  sox is a well known sound package.
What you get from the devices is some raw format, not a well-formed
sound file containing a header about the encoding, sample rate, etc.

> 	6. "playmidi -f something.mid" ( opl3 ) doesn't work at all - the

What does `cat /proc/sound` (or /dev/sndstat) say for Synth Devices?
Do your system logs complain about not being able to find a module for
synth0?  I believe the opl3 driver is in the adlib_card module (though
this may vary), does /proc/modules indicate that it is loaded?

> 	7. "playmidi -e (-D0) something.mid" ( uart401+WaveTable ? )
To be expected if you don't have an external midi device.

Good luck,
 Kevin
