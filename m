From: yodaiken@fsmlabs.com
Date: Sat, 28 Aug 1999 23:55:10 +0000
Subject: Re: [rtl] Low-latency patches working GREAT (<2.9ms audio latency), see testresults ,but ISDN troubl
Message-Id: <marc-linux-sound-93588421815439@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Sat, Aug 28, 1999 at 10:40:57PM +0200, Benno Senoner wrote:
> - The disk performance decreases by 10-25% when I increase the CPU load in
> the "latencytest" bench.
> (On light CPU load there are no disk performance differences,
> maybe this is related to higher scheduling overhead)
> 
> I think most of us want to have these "low-latency" features in the upcoming
> 2.4 kernel since it will make Linux a very good _MULTIMEDIA_OS_.


A 25% disk i/o decrease is very serious. Lets get some serious feedback
from people running internet and database servers before we blow off
the server users in order to compete with BEOS.
