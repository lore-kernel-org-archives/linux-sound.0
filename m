From: Andy Lo A Foe <andy@alsa-project.org>
Date: Tue, 26 Oct 1999 06:59:40 +0000
Subject: Re: [linux-audio-dev] streaming from disk to terminatorX added (via
Message-Id: <marc-linux-sound-94092126618198@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94078505714168@msgid-missing>
In-Reply-To: <marc-linux-sound-94078505714168@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Mon, 25 Oct 1999, Benno Senoner wrote:

> I doubt it that a CDROM drive can keep up with a nervous scratcher.
> :-)

Well, my Hitachi DVD-ROM does very well. I can get sustained playback 
at 500% (that's like ripping at 5 speed). Reverse playback works at up to
-400% reliably, that's enough for most 'scratching' purposes, unless the
DJs speed their records up 10x for a period of a few seconds :)

> The only solution is to keep in memory 100-200k samples before and past the
> actual playing position, but I think reading backwards from a CDROM drive sucks
> a lot.

Oh, actually I never read 'backwards' from a CD, or for that matter decode
an mp3 backwards. The ringbuffer is about 300K so that's enough for about
2 seconds of music.

Andy
--
AlsaPlayer, http://www.alsa-project.org/~andy/
