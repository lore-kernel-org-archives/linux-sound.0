From: Kadinger Andras <bandit@freeside.elte.hu>
Date: Mon, 26 Oct 1998 17:54:20 +0000
Subject: Re: MP3 encoder under Linux
Message-Id: <marc-linux-sound-90942940501987@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90938899516313@msgid-missing>
In-Reply-To: <marc-linux-sound-90938899516313@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hello Alexis,

On Mon, 26 Oct 1998, Alexis DOMJAN wrote:

> Under Windows I found a program that is able to convert an Audio CD track
> which is 3 minutes long in 2 minutes! And the quality is excellent...

Hmm, there is a lossless huffman encoding step in Layer 3; however, to
extract even the 'last percent of quality' possible, some encoders do an
exhaustive huffman search to find the absolute best compression
parameters. This does not influence sound quality directly, but it can
improve it indirectly, by providing for better compression, thus leaving
more bits for next frames - remember, the threshold for throwing away
'negligible' sound parts is constantly readapted according to the bits
used up by previous frames.

The quality improvement gained by this method is probably negligible at
128kbit/s or higher bitrates. However, it can help much more esp. for the
lowest bitrates, so that doing it there is usually worth the time spent
on it.

If I switch off huffman search on my mp3encdemo, encoding speeds up
perhaps to 6-10 times the original speed. Although I haven't conducted
extensive tests, my impression was that at 128kbit/s there was no audible
difference - YMMV though, as with all perceptual compression methods. 

Hope, this helps,

Sincerely,
Andras Kadinger
bandit@freeside.elte.hu
