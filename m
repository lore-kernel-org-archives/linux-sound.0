From: Conrad Parker <conradp@cse.unsw.edu.au>
Date: Thu, 20 Jul 2000 05:37:03 +0000
Subject: Re: sound/gui interaction
Message-Id: <marc-linux-sound-96407145801360@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-96407043600178@msgid-missing>
In-Reply-To: <marc-linux-sound-96407043600178@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

On Thu, Jul 20, 2000 at 01:15:07AM -0400, douglas irving repetto wrote:
> 
> hi there linux-sound,
> 
> i'm working on a linux sound app. my signal processing loop runs in its
> own thread. whenever i do a full drawing update of my GUI, i get a
> glitch in the sound output. my CPU usage goes up during the redraw, but
> not very much. does anyone know what's happening and how i can avoid it?
> i would think that doing the graphics and the sound in seperate threads
> would shield the one from the other, but apparently that's not the case.
> is this an XWindows issue perhaps?

your thinking is pretty much correct (as threads in Linux are
independently scheduled). What's most important is which thread is
writing to the sound device -- make sure you're not doing your
write()s in the same thread as dealing with X events.

If that's not the case... can we see the code?

Conrad.
