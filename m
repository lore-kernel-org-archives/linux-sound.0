From: Zwane Mwaikambo <zwane@linux.realnet.co.sz>
Date: Thu, 21 Feb 2002 14:30:20 +0000
Subject: Re: es1371 driver
Message-Id: <marc-linux-sound-101430276327753@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-101430199925056@msgid-missing>
In-Reply-To: <marc-linux-sound-101430199925056@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Thu, 21 Feb 2002, Wilmer van der Gaast wrote:

> (I found two addresses for Thomas, which one is the right one?)
The one you used.

> Why does it wait? When I play an MP3 and meanwhile accidentally visit a
> website which uses Flash, the whole Mozilla process freezes because it can't
> get /dev/dsp. Maybe all programs should be blamed for opening /dev/dsp
> without O_NONBLOCK, but for me altering this piece of kernel code worked a
> lot better. Now any open() is handled as O_NONBLOCK and I don't get those
> crashes anymore.

Its the userland apps which are broken, they should handle this a bit more 
sanely instead of throwing childish fits and running in the corner ;)

Regards,
	Zwane Mwaikambo


