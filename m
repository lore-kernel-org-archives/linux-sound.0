From: Ingo Molnar <mingo@chiara.csoma.elte.hu>
Date: Sun, 29 Aug 1999 07:22:24 +0000
Subject: Re: Low-latency patches working GREAT (<2.9ms audio latency), see testresults ,but ISDN troubles
Message-Id: <marc-linux-sound-93591157728770@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93586766006172@msgid-missing>
In-Reply-To: <marc-linux-sound-93586766006172@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


On Sat, 28 Aug 1999, Benno Senoner wrote:

> - The disk performance decreases by 10-25% when I increase the CPU load
> in the "latencytest" bench.  (On light CPU load there are no disk
> performance differences, maybe this is related to higher scheduling
> overhead) 

just in case anyone misunderstood the above result (as i think many did). 
The 'CPU load' mentioned above is a _realtime process_ (unless Benno you
changed the benchmark). This is a _good_ result.  'increase CPU load'
simply means 'generate more RT load' - which in _this case_ might mean
less disk performance - but the RT task asked for it in the first place.
All in one: i can see no problem here.

if a 'simple' CPU-user (non-RT) is getting more active there is no
slowdown.

-- mingo
