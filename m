From: Paco <paco@OhKeePa.Net>
Date: Wed, 23 Jun 1999 18:35:10 +0000
Subject: Re: Reducing "noise" from output
Message-Id: <marc-linux-sound-93016573325640@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93007835614102@msgid-missing>
In-Reply-To: <marc-linux-sound-93007835614102@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Wed, 23 Jun 1999, Bryan Scaringe wrote:

> So:  What is the difference between line-out and speaker-out,
> specificly from a functional standpoint.  Is line-out expected to
> be sent to an amplifier that will control bass/treble/vol?

Exactly.  For line-out, you have minimal control over the amplitude of the
signal.  "Line-level" voltage is (I believe) 2.2V, peak-to-peak.  Volume
control of line-out allows you to change this peak-to-peak value, but not
significantly.

Line-out signals are meant to go to another device which will control the
bass/treble/volume.  (ie, your stereo)

Speaker-out signals are amplified *on-the-card* and provide enough juice
to power speakers themselves.  This on-card amplification may be the cause
of your hiss.  (I'm not too sure if the on-card amplifiers are very
high-quality on an AWE64.)

> Is this why line-out is less responsive to bass/treble changes
> using "aumix" than speaker-out?

BINGO!  Bass and treble controls function just like the volume control for
line-out; they *do* cause changes in the signal, but not significant ones.
You can think of bass and treble controls as "turning up the volume" of
the low or high EQ bands.

regards,
Chad "Paco" Walker
