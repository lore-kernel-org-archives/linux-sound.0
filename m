From: Jaroslav Kysela <perex@suse.cz>
Date: Thu, 26 Aug 1999 20:51:18 +0000
Subject: Re: Bad MIDI performance : 10ms latency instead of the expected
Message-Id: <marc-linux-sound-93570827715277@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93568883025986@msgid-missing>
In-Reply-To: <marc-linux-sound-93568883025986@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Thu, 26 Aug 1999, Alan Cox wrote:

> > > 200bytes/sec is just rudiculous , how do you plan to drive an external synth
> > > with that little MIDI bandwidth ?
> > 
> > I need a timer around 2000Hz for some good code. I won't support polling
> > mode (busy loop) in any case.
> 
> Then your code will never be usable. Some hardware sucks, you have to do
> limited polling with a timer backoff. A well tuned polling loop will often
> work out nicely providing you are careful. Remember with irqs on you are
> just like busy in userspace no worse. You can even do
> 
> 	while(poll_input()=0)
> 	{
> 		if(current->need_resched())
> 			schedule();
> 	}
> 
> sort of stuff

Is possible to create some thread for this loop inside kernel module?
I don't want to suspend the application execution due to a broken
hardware. I did some tests with 2.2 kernels (using kernel_thread()) and
I've not been successful.

						Jaroslav

-----
Jaroslav Kysela <perex@suse.cz>
SuSE Linux    http://www.suse.com
ALSA project  http://www.alsa-project.org
