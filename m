From: Britton <fsblk@aurora.uaf.edu>
Date: Mon, 03 Apr 2000 03:31:52 +0000
Subject: Re: close()ing audio device always yields 'Interrupted system call'
Message-Id: <marc-linux-sound-95473328816807@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95464148708818@msgid-missing>
In-Reply-To: <marc-linux-sound-95464148708818@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


On Sat, 1 Apr 2000, Dave Mielke wrote:

> [quoted lines by Britton on April 1, 2000, at 17:08]
> 
> >Even if I SYNC or RESET the device before closing.  
> 
> The close() is taking a significant amount of time, and your program is
> receiving a signal during that interval.

This is apparently exactly what was happening Dave, thanks for your help.  
The guilty(?) signal turns out to be SIGCHLD, and looks like being due to
the manager thread going zombie.  The odd thing is that both the threads
finish, and return success codes, and have apparently done their jobs
correctly, but the problem still comes up when I try to close /dev/dsp,
even if I sleep() for a while before trying the close().  Is it expected
behavior for the kernel to bother the parent process with signals
regarding thread child process states, even after successful
pthread_join()s, or is this suspicious behavior on the part of the kernel
or thread library?  Why should I get this signal at the exact point where
I call close(audio_fd)?  

I thought I would ask here before pestering the kernel people, any advice
greatly appreciated, and thanks again for your help.

> -- 
> Dave Mielke           | 856 Grenon Avenue | I believe that the Bible is the
> Phone: 1-613-726-0014 | Ottawa, Ontario   | Word of God. Please contact me
> EMail: dave@mielke.cc | Canada  K2B 6G3   | if you're concerned about Hell.

Britton
