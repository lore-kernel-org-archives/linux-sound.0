From: Benno Senoner <sbenno@gardena.net>
Date: Mon, 23 Aug 1999 18:06:42 +0000
Subject: Re: Streaming disk I/O kills file buffering and makes Linux unusable
Message-Id: <marc-linux-sound-93543160108034@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93541443318803@msgid-missing>
In-Reply-To: <marc-linux-sound-93541443318803@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Mon, 23 Aug 1999, Linus Torvalds wrote:
> On Mon, 23 Aug 1999, Peter Monta wrote:
> > 
> > > I think without some buffer-cache usage limiting, or buffering disabling,
> > > Linux is actually UNSUITABLE for streaming applications which do run
> > > concurrently with other apps.
> > 
> > I agree; the raw-io system will make this much more pleasant.
> 
> Why do you think so?
> 
> IO is IO, whether it is raw or not. And it will eat up resources from
> everybody else trying to do IO.
> 
> I think this is a case of believing in magic cures and supernatural
> beings.
> 
> 		Linus

IO is IO, BUT:   buffering algorithms do work well almost all the time
under _NORMAL_ conditions , but
streaming hundreds of MBytes from disk (reading) , allocates all buffers
for these files (which you read only once, therefore buffering is not required),
and all other apps and files ( your browser , windowmanager, X server xterm ,
bash etc) are evicted from the buffer cache, and every time (with maybe 10-30
secs in between) you launch a new xterm, click to the KDE's application bar,
the disk has to reload the page for the executables, which makes you run
the disk as it were not buffered.

Is it hard to implement unbuffered disk I/O in Linux (at least for reading) on
per file basis so that reading large files doesn't monopolizes the buffer cache
decreasing the overall caching effectiveness ?

Another solution could be limiting file buffering on a per-process basis,
If the streaming app can tell to the kernel "give me only 4MB of your buffer
cache", then the rest of the apps will still get a chunk of the buffer cache so
that launching my xterm multiple times will work nicely without reading from
disk every time.
Is the second solution maybe easier to implement ?

I'm afraid, if we want that Linux will be a good multimedia OS, this is a
_STRONGLY_NEEDED_  feature.

The user wants to playback his video/audio from disk, and still be able
to launch his apps, without waiting 10 secs for loading a simple xterm.

The SCT's  raw-io patches are nice, but not very suitable in a general purpose
multimedia enviroment, since you can't tell to the user to store his videos on a
raw partition.
  
regards,
Benno.
