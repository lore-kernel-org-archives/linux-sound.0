From: Andy Lo A Foe <andy@alsa-project.org>
Date: Sun, 24 Oct 1999 17:09:27 +0000
Subject: Re: [linux-audio-dev] streaming from disk to terminatorX added (via
Message-Id: <marc-linux-sound-94078514814215@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94078505714168@msgid-missing>
In-Reply-To: <marc-linux-sound-94078505714168@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Sun, 24 Oct 1999, Benno Senoner wrote:

> Suggestions to the author:  (any official word from you Alexander ?)
> 
> - always use mmap since it will work well on big RAM boxes too,
> and doesn't eat up all you system memory.
> 
> -in order to support MP3s and other fileformats decompress/convert this
> files first to a temporary WAV file and mmap() this into mem.
> 
> To speed up things even more you could save a the sample graph into
> a little file the first time you load the audio file, so that on subsequent
> loads, the 100MB audio file will "load" almost istantaneously in to mem.
> (thanks to mmap() ).
> 
> It would be possible to support direct disk streaming of MP3 files,
> but that is not a trivial task since you can't access an MP3 in
> random order, since the windowing filter depends on the previous
> filter state information.
> One way could be to store the filterstates of every mpeg frame into 
> a separate file and then reload the filter during seeks into the file. 
> But that would require to include an entire mp3 player with modified
> windowing filter code.
> 
> PS: Now if we could get one of these turntables recorded with special
> static waves (saw waves), we could add add turntable motion detection
> and get the same features as "finalscratch" on BeOS:
> scratching an audiofile in realtime using a real turntable.
> :-)

<shameless plug>

You might want to check out alsaplayer, http://www.alsa-project.org/~andy/
It does 'direct streaming from disk' for just about any format without
using mmap. It uses a ring buffer system and threading to cache data and
there is code for very low latency modes using SCHED_FIFO.
If you really want to emulate "finalscratch" just put the scratching mouse
functionality of terminatorX in some sort of plugin for alsaplayer. It
supports variable speed control (negative too, which is needed for
'scratching'). With a fast enough CDDA capable CDROM you can even
'scratch' your music CDs in realtime :-)

</shameless plug>

Andy
--
AlsaPlayer, http://www.alsa-project.org/~andy/
