From: Dave Caswell <davec@asylum.apocalypse.org>
Date: Sun, 12 Mar 2000 04:14:25 +0000
Subject: Re: Sound problems in 2.3.50
Message-Id: <marc-linux-sound-95283503918104@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95272621612831@msgid-missing>
In-Reply-To: <marc-linux-sound-95272621612831@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org




>Well, Christoph Hellwig is apparently adapting the sound drivers to the
>newer module initialization scheme, which should make it easier to just
>configure drivers into the kernel.  An additional change was the removal
>of /dev/sndstat and /proc/sound, so that explains that part of the problem.

How come /proc/sound was removed?  Is there an alternative place to get
that information?

>Well, from what I can tell, your opl3sa2 append line for lilo.conf should
>have gotten things working, but there was some talk of general sound issues
>with 2.3.50 on linux-kernel.  Could you try 2.3.51 and see if that works?
>It contains a bunch more patches to the sound system.

I've been watching for sound articles on linux-kernel, and looks like
there are changes in 2.3.51 which may effect my problem. But sadly,
2.3.51 wont build on my system, so I'm just waiting for next week and
2.3.52, or 2.4-pre-1, or whatever.   When I get a new kenel built,
I'll report back.

Thanks,

	dave caswell
