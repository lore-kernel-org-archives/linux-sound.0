From: Benno Senoner <sbenno@gardena.net>
Date: Sun, 24 Oct 1999 15:14:07 +0000
Subject: streaming from disk to terminatorX added (via mmap)
Message-Id: <marc-linux-sound-94077890409185@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

for those that are interested:

Yesterday I went on terminatorX's (the scratching app)  homepage (
http://termX.cjb.net ), and read in the FAQ that it doesn't support streaming
from disk, because it would require a complete redesign of the app.
But fortunately Alexander was wrong:
:-)
use mmap and it's powerful caching algorithms.

I added from disk streaming because I think that many users
running on low memory boxes could run into big troubles
when scratching large audiofiles.
( The audiofile could not fit into the swaparea, and the
loading of the file could take very long, since it has to be swapped out,
etc.)

the patch is here:

http://www.gardena.net/benno/linux/terminatorX-3.2-mmap.patch


Basically what I changed is:
instead of loading the file into RAM, I mmap() the entire file 
into memory.
Since the kernel loads pages of the file into mem when they
are needed, it could cause audio-dropouts when working with
low audio buffer sizes (low latency) since, the playing thread
might wait too long for the kernel which tries to load the pages
into mem.

One trick to avoid this it to add a low priority thread , which does
basically read-ahead and read-behind, by accessing to pages 
before and past the actual playing position.
It doesn't matter if this thread blocks for a moment, 
since it doesn't play any audio data.
The audio thread will always find the needed pages in memory and
will not drop out.

With this approach I was able to scratch a 100MB mono file,
on a 16MB RAM box, running X , KDE and Netscape (what a pain to load netscape :-) ) !
(using SCHED_FIFO scheduling)

ATTENTION:

sometimes: there might  occur audio dropouts during streaming from disk,but
that is not the fault of the app but, it's a common problem of Linux.

For dropout free low-latency performance apply the low-latency patches
at
http://www.gardena.net/benno/linux/audio

and tune your EIDE as described in the page
( /sbin/hdparm -c 1 -m 8 -u 1 -d 1 /dev/hda  for example)

Linux 2.4 will contain the low-latency patches as default,
and this will be a great benefit for realtime apps like terminator-X.

I hope that scratchers running on low RAM boxes will enjoy the mmap patch !
:-)

BUGS:

- the 44byte WAV header isn't skipped
- mpg123 and sox support doesn't work (would require decompressing
to a temporary file)
- might not work on BIGENDIAN boxes

Suggestions to the author:  (any official word from you Alexander ?)

- always use mmap since it will work well on big RAM boxes too,
and doesn't eat up all you system memory.

-in order to support MP3s and other fileformats decompress/convert this
files first to a temporary WAV file and mmap() this into mem.

To speed up things even more you could save a the sample graph into
a little file the first time you load the audio file, so that on subsequent
loads, the 100MB audio file will "load" almost istantaneously in to mem.
(thanks to mmap() ).

It would be possible to support direct disk streaming of MP3 files,
but that is not a trivial task since you can't access an MP3 in
random order, since the windowing filter depends on the previous
filter state information.
One way could be to store the filterstates of every mpeg frame into 
a separate file and then reload the filter during seeks into the file. 
But that would require to include an entire mp3 player with modified
windowing filter code.

PS: Now if we could get one of these turntables recorded with special
static waves (saw waves), we could add add turntable motion detection
and get the same features as "finalscratch" on BeOS:
scratching an audiofile in realtime using a real turntable.
:-)

regards,

Benno.
sbenno@gardena.net
