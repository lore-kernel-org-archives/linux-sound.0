From: est@hyperreal.org
Date: Tue, 26 Oct 1999 17:10:05 +0000
Subject: mmap()/mlockall()/read()
Message-Id: <marc-linux-sound-94095888330340@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Benno Senoner discourseth:
> 
> Eric,
> when not mlock()-ing the entire process (or at least the RT relevant data),
> you have no chance to give ANY guarantee thet some pages could
> not be swapped out.

That's exactly my concern..I have no guarantees that I won't run into
N page-faults in a given period and miss my deadlines.  Unfortunately,
locking and mapping aren't that flexible.  I need to use
mlockall(MCL_CURRENT | MCL_FUTURE) to make sure I have no page faults.
Then anything I mmap() will be initially locked as well..even though
it may be larger than my RAM.  A MAP_UNLOCKED option to mmap() would
be a non-portable solution.

> What I'm trying to say: read() doesn't work better than mmap() in terms of
> behaviour during swapping, because the kernel could easily swap out
> your buffer where you read() in the data.

Actually, the last time I tested this extensively (with a 2.0.x kernel
I think), mmap() was much better performing than read()..for a while.
When sequential accessing of a file got to a point around my RAM
limits, the disk activity became insane.  Maybe things are better now.

> I will add a feature to the pagefaulter thread which uses mlock()/munlock if
> root privileges are available, so that even
> Eric is satisfied.
> :-)

Eric is hard to satisfy. :)

> PS: mlockall(MCL_CURRENT|MCL_FUTURE) is a bad idea because when you do the
> mmap() of the large file the process tries to load all into mem,and my scheme
> would not work. Better to use mlockall(MCL_CURRENT) and mlock()/munlock()
> areas on demand.

This is a useful solution in some circumstances.  However, it means I
can't use malloc()/new, may have trouble with shared libraries or
dynamically loaded plugins and have to worry about reserving stack
space.  It's not the way I want to work.

Eric
