From: u81ib6r2@umail.furryterror.org (Zygo Blaxell)
Date: Thu, 11 Feb 1999 16:39:09 +0000
Subject: Re: successive mmap()s will not work to record sound?
Message-Id: <marc-linux-sound-91875132405939@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-91871041516692@msgid-missing>
In-Reply-To: <marc-linux-sound-91871041516692@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

In article <Pine.OSF.3.96.990210195646.13922A-100000@aurora.alaska.edu>,
Britton  <fsblk@aurora.alaska.edu> wrote:
>I have been trying to write a brec-like program that will record long
>tracks of raw sound using many successive mmap()s of the same file, but it
>isn't working.  I get stuff like this:
>
>incorrect number of bytes written: Interrupted system call
>Sound: Recording overrun 
><DMA somethingorother times> out - IRQ/DRQ config error?
>
>ad nauseum
>
>Does this mean that my code is not keeping up with the sound card?
>
>Is this approach not feasible?  Here are the salient features of the
>program: 

No, it's not feasible.

The filesystem will block at inconvenient times sometimes for up to fives
seconds (this on 33MB/s UDMA AT drives).  This only gets worse if you are
doing mmap().

What you want to do is read into shared memory with one process or
thread and write to disk with another process or thread.  Depending on
your performance requirements even just two processes with select() is
enough.

-- 
Zygo Blaxell, Linux Engineer, Corel Corporation, zygob@corel.ca (work),
zblaxell@furryterror.org (play).  It's my opinion, I tell you! Mine! All MINE!
Size of 'diff -Nurw [...] winehq corel' as of Thu Feb 11 11:14:01 EST 1999
Lines/files:  In 489 / 13, Out 6321 / 74, Both 6807 / 86
