From: Benno Senoner <sbenno@gardena.net>
Date: Mon, 23 Aug 1999 20:51:54 +0000
Subject: Re: Streaming disk I/O kills file buffering and makes Linux unusable
Message-Id: <marc-linux-sound-93544041219638@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93541443318803@msgid-missing>
In-Reply-To: <marc-linux-sound-93541443318803@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Mon, 23 Aug 1999, Alan Cox wrote:
> > I'm afraid, if we want that Linux will be a good multimedia OS, this is a
> > _STRONGLY_NEEDED_  feature.
> > 
> > The user wants to playback his video/audio from disk, and still be able
> > to launch his apps, without waiting 10 secs for loading a simple xterm.
> > 
> > The SCT's  raw-io patches are nice, but not very suitable in a general purpose
> > multimedia enviroment, since you can't tell to the user to store his videos on a
> > raw partition.
> 
> Stephens patches are basis of raw I/O on files in a filesystem too.

That sounds nice to me !
Any idea when some patches ( for raw file I/O in a filesystem) will be available
? 
> 
> However what you are saying and raw-io don't neccessarily tally. You are
> actually saying "there is a bug in the current page cache handling for
> this kind of operation". Far better therefore to fix the heuristic used.

No , I'm not saying that there is a bug, I'm saying that the
filebuffering works very well in almost all cases , except of reading large
files from disk continuously.
This is of course quite logical since the kernel makes assumptions that you
will read this large file again, and therefore the kernel has to put it into
the buffer cache.

In this case I don't need raw I/O to get fast response or higher throughput,
but only  to avoid that the streaming apps do not monopolizes the buffer, which
is very bad.

will the SCT's patches add an O_DIRECT -like flag ala SGI ?

regards,
Benno.
