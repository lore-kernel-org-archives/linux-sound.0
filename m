From: ford@omnicron.com (Mike "Ford" Ditto)
Date: Mon, 12 Oct 1998 06:52:30 +0000
Subject: Re: CW-7502 -> cdda2wav -> zeroes
Message-Id: <marc-linux-sound-90818835225938@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90607851214906@msgid-missing>
In-Reply-To: <marc-linux-sound-90607851214906@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

A while back I wrote:
> I am trying to use Cdda2wav version 0.8 to read audio tracks from a
> Panasonic CW-7502 (which is widely reported to have good CDDA reading
> capability).  The program can read and display the TOC correctly and it
> writes the correct number of bytes into the output file, but all of the
> audio samples are zero (total silence).
[ ... ]

A few other people reported that they had the same difficulty.

For the record:  An email from cdda2wav author Heiko Eissfeldt
<heiko@colossus.escape.de> indicated that a newer version of cdda2wav
exists which works with the CW-7502:
    ftp://ftp.gwdg.de/pub/linux/misc/cdda2wav/cdda2wav-0.95beta07.tar.gz

I tried it and it worked perfectly!

					-=] Mike [=-
