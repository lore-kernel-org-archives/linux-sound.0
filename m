From: Benno Senoner <sbenno@gardena.net>
Date: Mon, 25 Oct 1999 12:52:29 +0000
Subject: Re: [linux-audio-dev] streaming from disk to terminatorX added (via mmap)
Message-Id: <marc-linux-sound-94089505926730@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94078505714168@msgid-missing>
In-Reply-To: <marc-linux-sound-94078505714168@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Sun, 24 Oct 1999, Andy Lo A Foe wrote:

> 
> You might want to check out alsaplayer, http://www.alsa-project.org/~andy/
> It does 'direct streaming from disk' for just about any format without
> using mmap. It uses a ring buffer system and threading to cache data and
> there is code for very low latency modes using SCHED_FIFO.
> If you really want to emulate "finalscratch" just put the scratching mouse
> functionality of terminatorX in some sort of plugin for alsaplayer. It
> supports variable speed control (negative too, which is needed for
> 'scratching'). With a fast enough CDDA capable CDROM you can even
> 'scratch' your music CDs in realtime :-)
> 
>

I doubt it that a CDROM drive can keep up with a nervous scratcher.
:-)
The only solution is to keep in memory 100-200k samples before and past the
actual playing position, but I think reading backwards from a CDROM drive sucks
a lot.

regards,
Benno.
