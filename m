From: Jeff Tranter <tranter@pobox.com>
Date: Wed, 12 May 1999 21:44:59 +0000
Subject: Re: Playing a sine wave
Message-Id: <marc-linux-sound-92658863601553@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92649832906805@msgid-missing>
In-Reply-To: <marc-linux-sound-92649832906805@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Wed, 12 May 1999, Hannu Savolainen wrote:

> A much easier way is using /dev/dsp. You only need to construct few cycles
> of sine wave at given frequency to a buffer. Then just keep writing this
> buffer to /dev/dsp as many times as you need. In fact it may even be
> possible that somebody has already written this kind of app (look at
> ftp://sunsite.unc.edu/pub/Linux/apps/sound).

Yes, I wrote such a program using /dev/dsp. Look for "wave"
on sunsite.unc.edu, probably in the directory mentioned above
unless they moved it.

It can do sine, square, triangle, and ramp waveforms, in stereo.

--
Jeff Tranter (mailto:tranter@pobox.com http://www.pobox.com/~tranter)
Currently running Linux 2.2.7      Learn more at http://www.linux.org
