From: Benno Senoner <sbenno@gardena.net>
Date: Sun, 29 Aug 1999 21:51:45 +0000
Subject: Re: Low-latency patches working GREAT (<2.9ms audio latency), see testresults ,but ISDN troubles
Message-Id: <marc-linux-sound-93596350426748@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93586766006172@msgid-missing>
In-Reply-To: <marc-linux-sound-93586766006172@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Sun, 29 Aug 1999, Ingo Molnar wrote:
> On Sat, 28 Aug 1999, Benno Senoner wrote:
> 
> > - The disk performance decreases by 10-25% when I increase the CPU load
> > in the "latencytest" bench.  (On light CPU load there are no disk
> > performance differences, maybe this is related to higher scheduling
> > overhead) 
> 
> just in case anyone misunderstood the above result (as i think many did). 
> The 'CPU load' mentioned above is a _realtime process_ (unless Benno you
> changed the benchmark). This is a _good_ result.  'increase CPU load'
> simply means 'generate more RT load' - which in _this case_ might mean
> less disk performance - but the RT task asked for it in the first place.
> All in one: i can see no problem here.

Ingo, you are right: I just ran the unmodified latencytest and was measuring 
disk performace.
In my example I used 1.45ms fragments, this means that my realtime thread
has to be rescheduled about 600times/sec ,
and during each 1.45ms cycle the rt thread wastes about 1.1ms (= 80% of 1.45ms)
of the CPU.


If you lower the CPU load to low values ( 10% for example) , there is not a big
substantial disk WRITE performance loss compared to an unpatched kernel.

The interesting thing is that the disk READ performance is unaffected by your
patches, on CPU loads of 80% I get the same disk READ performance on 
your lowlatency-N6 kernel as on a standard kernel.
Perhaps the problem lies in your modifications in the disk write code ?


> 
> if a 'simple' CPU-user (non-RT) is getting more active there is no
> slowdown.

I don't tested this yes, but I think you are right.
(Will report back some numbers when I get the benchmarking done).

You said your patch was 100% stable: are we talking about the same patches ?
The latest I got was -N6 + shm.c backed out + Roger's conditional_schedule()
wrapping in filemap.c.

The kernel is rock solid , except it crashes when I do a modprobe of the ISDN
hisax.o module.

regards,
Benno.
