From: Ingo Molnar <mingo@chiara.csoma.elte.hu>
Date: Sun, 29 Aug 1999 07:15:19 +0000
Subject: Re: [rtl] Low-latency patches working GREAT (<2.9ms audio latency), see testresults ,but ISDN troubl
Message-Id: <marc-linux-sound-93591069828296@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93588421815439@msgid-missing>
In-Reply-To: <marc-linux-sound-93588421815439@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


On Sat, 28 Aug 1999 yodaiken@fsmlabs.com wrote:

> I'm concerned that the major improvement has come from additional 
> calls to schedule instead of from some basic improvements in algorithm.

there are _no_ extra calls to schedule, only if necessery. Zero, nil,
nada. Please check out the patch.

-- mingo
