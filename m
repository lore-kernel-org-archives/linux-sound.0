From: yodaiken@fsmlabs.com
Date: Sun, 29 Aug 1999 01:59:02 +0000
Subject: Re: [rtl] Low-latency patches working GREAT (<2.9ms audio latency), see testresults ,but ISDN troubl
Message-Id: <marc-linux-sound-93589194220268@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93588421815439@msgid-missing>
In-Reply-To: <marc-linux-sound-93588421815439@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Sun, Aug 29, 1999 at 01:24:08AM +0100, Alan Cox wrote:
> > A 25% disk i/o decrease is very serious. Lets get some serious feedback
> > from people running internet and database servers before we blow off
> > the server users in order to compete with BEOS.
> 
> For most people its unacceptable in that form, but nobody has yet sat down
> and tuned the tuned code to get the disk performance all back. I don't think
> the two are exclusive.

I'm concerned that the major improvement has come from additional 
calls to schedule instead of from some basic improvements in algorithm.
Calls to schedule are not free and I'm not smart enough to see an
obvious way to add a rescehdule 
into a loop that dumps all write data to buffers without damaging
thoughput.  This seems like _another_  tunable parameter
          start io-loop
             do chunk
             io_reseched()
             end loop

io_resched
       if (really_want_soft_rt > resched count)
                schedule



> 
> We also have tons of time. Its not a 2.2. candidate
> 
> 
> --- [rtl] ---
> To unsubscribe:
> echo "unsubscribe rtl" | mail majordomo@rtlinux.cs.nmt.edu OR
> echo "unsubscribe rtl <Your_email>" | mail majordomo@rtlinux.cs.nmt.edu
> ----
> For more information on Real-Time Linux see:
> http://www.rtlinux.org/~rtlinux/
