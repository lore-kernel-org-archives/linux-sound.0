From: Benno Senoner <sbenno@gardena.net>
Date: Fri, 27 Aug 1999 18:06:32 +0000
Subject: Re: playing MP3 vs CPU usage
Message-Id: <marc-linux-sound-93577719209032@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93577292904421@msgid-missing>
In-Reply-To: <marc-linux-sound-93577292904421@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Fri, 27 Aug 1999, Yau Chan wrote:
> Hi.  I'm a beginner in Linux.
> I just set up my new sound card and it plays very good when
> I'm plaything something alone.  But when I'm playing a song
> in a terminal, and tryig to do something else.  like switching
> to another terminal on the Desktop, the song will stall for
> a very very short bit.  i tried to keep track of the CPU
> usage.  when it's playing the song alone, it's using about
> 20%.  But whenever i try to do something else, it just jump
> to full for a short instance.  I wonder if there is any way
> that I can modify it so that it will be more smooth when i'm
> playing song and do other things.  Thanks.
> 
> I'm using a very slow computer, which is a Pentium 133.
> But I don't have such problem in windows95 and windows NT.
> So, I guess linux should do better.  Thank you very much.
> 

Linux actually has some problems in this area, especially on slow computers.
The trick is to increase audio buffers of your mp3 player (what player are you
using ?),
plus tuning your EIDE disk with
hdparm -d 1 -u 1 -m 8 -c 1  /dev/hda
because when there are disk accesses, the kernel stalls sometimes, especially
when you run non-DMAed disks
most distros don't tune your disk properly.

Perhaps if your player supports realtime-scheduling , your could try to run it
as root to see if things get better.

The P133 is easily capable of playing an MP3 , the problem is mainly buffering
and process scheduling. ( already solved in some unofficial patches,
let's see if they can get into the mainstream kernel :-) )

regards,
Benno.
