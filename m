From: yodaiken@fsmlabs.com
Date: Sun, 29 Aug 1999 13:59:20 +0000
Subject: Re: [rtl] Low-latency patches working GREAT (<2.9ms audio latency), see testresults ,but ISDN troubl
Message-Id: <marc-linux-sound-93593516007821@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93588421815439@msgid-missing>
In-Reply-To: <marc-linux-sound-93588421815439@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


Here is a fundamental change from Ingo's patch:
 #define __copy_user(to,from,size)                                      \
 do {                                                                   \
        int __d0, __d1;                                                 \
+       conditional_schedule();                                         \
        __asm__ __volatile__(                                           \
                "0:     rep; movsl\n"                                   \
                "       movl %3,%0\n"  

Big change. And I think it is a change that makes a mistake about
what is more important. Terminating an i/o and being able to 
release a buffer is not always less critical than running the
next process.


And my candidate for "irreparably breaks Oracle" is
                for (i = nr_buffers_type[BUF_LOCKED]*2 ; i-- > 0 ; bh = next) {
+                       if (current->need_resched) {
+                               bh->b_count++;
+                               schedule();
+                               bh->b_count--;

What does Lmbench report on this patch set? I bet that the throughput
tests show the difference.

It would be interesting to consider how these changes might interact
with, for example, Stephen's semi-i/o-light changes for direct io or with
new fs designs or changes to the network subsystem. 

Some problems:
1. extra calls to schedule trash cache and trade bandwidth for latency
2. assumptions about machine timing become embedded in basic code and 
   will cause problems as timing changes.
3. the fundamental technique of this patch is to introduce reschedules
   that hide the problem instead of solving it. Instead of
   start_long_copy
          do a chunk
          conditional_reschedule
          loop
   It's more interesting to think about how to avoid the long copy in 
   the first place. A write request that asks to dump a big chunk of
   memory to i/o seems like it should be made to be lower latency by
   using a k buffer to page align and then doing direct i/o on user
   pages. Or, alternatively, we could put some smarts in libc for
   big i/o, or maybe we can make "write" understand something more
   about the destination device so that it can delegate copying to 
   smart devices and use a just-in-time copying approach for other
   devices. Any of these are a lot more difficult than introducing
   resched calls.
