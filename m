From: Chuck Lever <cel@monkey.org>
Date: Mon, 23 Aug 1999 18:39:19 +0000
Subject: Re: Streaming disk I/O kills file buffering and makes Linux unusable
Message-Id: <marc-linux-sound-93543647615106@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93541443318803@msgid-missing>
In-Reply-To: <marc-linux-sound-93541443318803@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Mon, 23 Aug 1999, Peter Monta wrote:
> > Will future kernels ave an O_DIRECT like flag to avoid caching ?
> 
> Stephen Tweedie has written a patch for unbuffered I/O; the URL I have
> from some time ago is
> 
> ftp://ftp.linux.org.uk/pub/linux/sct/fs/raw-io
> 
> though this host doesn't seem to respond at the moment.  I believe
> Stephen has mentioned that this will go into the main tree at some point.
> (Possibly it's already in 2.3.x---I haven't looked recently.)
> 
> > I think without some buffer-cache usage limiting, or buffering disabling,
> > Linux is actually UNSUITABLE for streaming applications which do run
> > concurrently with other apps.
> 
> I agree; the raw-io system will make this much more pleasant.

seems to me what you really want is an application-specific file system
that is designed to manage streamed data on disks.  i've been very
impressed with the Sony MiniDisc file system -- it's a simplified file
system that transparently manages data on MO MiniDiscs.

the name space is flat -- you can have 1 to 255 separate "tracks", and
i've seen this system used for monaural or up to 8 concurrent channels of
recording, on 128M MO disks.  i'm no expert, but i'd bet a faster, larger
disk could be used to boost the number of concurrent channels.  it's
probably just a matter of how many channels can be multiplexed into a
track's block stream.

a simple TOC-based block-allocation system is used.  the TOC is stored in
the disk writer's volatile memory, and written out when the disk is
ejected; this eliminates the extra seeks involved with metadata updates.
new blocks are allocated sequentially from free space at the end of the
disk, or eventually from blocks freed by erasing tracks of previously
recorded material. a text area of about 2K per disk is reserved for
tagging each track with "title" data.

for managing a large disk, one might extend such a file system to handle
more tracks, more blocks, and generate a periodic TOC update that writes
the TOC into special areas allocated across the entire disk to minimize
seek latency.

this kind of system would eliminate the need for indirect blocks or even
extent-based allocation, and keep metadata updates very cheap.  it would
also make it easy to combine, divide, and otherwise edit the data in the
tracks.

another example of an application-specific file system was early Dyaxis
gear. the Dyaxis editing suite ran on a Mac II, but used separate disks
and some proprietary form of HFS, i think, to record and edit audio data.

but it might be cool to have a special simplified file system that was
designed specifically to manage time-critical streamed data like
multitrack audio or video.

	- Chuck Lever
--
corporate:	<chuckl@netscape.com>
personal:	<chucklever@netscape.net> or <cel@monkey.org>

The Linux Scalability project:
	http://www.citi.umich.edu/projects/linux-scalability/
