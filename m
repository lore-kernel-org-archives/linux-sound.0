From: Benno Senoner <sbenno@gardena.net>
Date: Mon, 23 Aug 1999 20:50:32 +0000
Subject: Re: Streaming disk I/O kills file buffering and makes Linux unusable
Message-Id: <marc-linux-sound-93544143220589@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93541443318803@msgid-missing>
In-Reply-To: <marc-linux-sound-93541443318803@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Mon, 23 Aug 1999, Andrea Arcangeli wrote:
> On Mon, 23 Aug 1999, Benno Senoner wrote:
> 
> >No , I'm not saying that there is a bug, I'm saying that the
> >filebuffering works very well in almost all cases , except of reading large
> >files from disk continuously.
> 
> Could you check `vmstat 1` and verify if you have continous
> swapin/swapout? (I bet yes) If I am right then you'll probably want to
> apply this my patch and try again and notice the performance difference
> with eyes.
> 
> 	ftp://ftp.suse.com/pub/people/andrea/kernel-patches/my-2.2.12-final3/no-swapout-2.2.10-B
> 
> Andrea

No , have very little swapin/swapouts (only occasionally) when clicking on the
xterm icon. 
Since I run on a 256MB RAM box, I have to wait 30-40sec for the xterm
executable disappearing from buffers ( since I stream about 5MB/sec).
After this time when I must wait up to 5-6sec from clicking to the icon to the
actual launch of the xterm.
Of course this is because the disk is under high load , and loads the
executable slowly, but if I I click on the icon again after only a few secs
(instead of waiting 30-40secs) the 2nd xterm starts up almost immediately since
it's still cached,  200MB filebuffer buffer/5MB/sec = takes about 40secs to fill
all buffers.

Browsing the web while runnig the streaming app, becomes frustrating because 
you have no caching at all while working on a very slow disk (due to disk I/O).
IMHO with direct I/O the rest of the system will remain quite snappy.

regards,
Benno.
