From: David Olofson <audiality@swipnet.se>
Date: Thu, 13 Jan 2000 04:05:16 +0000
Subject: Re: Problems with X11Amp
Message-Id: <marc-linux-sound-94774998419683@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-94767267915863@msgid-missing>
In-Reply-To: <marc-linux-sound-94767267915863@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Wed, 12 Jan 2000, Bryan Scaringe wrote:
> 2) It takes a lot of CPU cycles to decode MP3's.  If you run a lot of
>    stuff while listening to an MP3, it's going to sound horrible.

...unless you use Linux 2.2 + the lowlatency patch, and sets the mp3
player thead to SCHED_FIFO. That makes the player run as a true hard
real time task, ie it will never drop-out, and it'll just take the
CPU time it needs. (Provided your CPU is fast enough, obviously! :-)

In case you have missed it, see

	http://matrix.crosswinds.net/~linuxmusic/lowlatency.html

It seems like a refined version of the lowlatency patch is going into
the mainstream 2.4 kernels... (Cutting scheduling latencies does
bring advantages in other areas than real time processing as well.)


//David


.- M u C o S -------------------. .- A u d i a l i t y ----------------.
| A Free/Open Multimedia        | | Rock Solid, Hard Real Time,        |
| Plugin & Integration Standard | | Low Latency Signal Processing      |
`------> www.linuxdj.com/mucos -' `--> www.angelfire.com/or/audiality -'
.- D a v i d   O l o f s o n ------------------------------------------.
| Audio Hacker, Linux Advocate, Open Source Advocate, Singer/Composer  |
`----------------------------------------------> audiality@swipnet.se -'
