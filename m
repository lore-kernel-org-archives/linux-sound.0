From: "Robert B. Hamilton" <rbh041a@unix.tamu.edu>
Date: Fri, 23 Apr 1999 18:35:02 +0000
Subject: Re: [RFD] Alternative PC speaker drivers?
Message-Id: <marc-linux-sound-92489349827822@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92472595425861@msgid-missing>
In-Reply-To: <marc-linux-sound-92472595425861@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

> The PC speaker driver is a neat hack, but with the cost of low-end
> sound cards ($25-$30 in these parts for a SB16), I wonder if anyone
> would really use it.

Certainly that's true.  Still, people might find a use for it as
a "baseline" sound device (however crude) that is nearly guaranteed 
to be on every ix86 machine; and there is the occasional inquiry on l-k.
So perhaps there is no good reason not to support it, *provided* the 
support can be done in a technically acceptable manner.

Which brings us back to my original note.  Conventional wisdom has
had it that the maximum 8192Hz rate of the RTC is too low to support
the speaker driver.  I don't think that is true any more.  With faster
cpus one can use udelay's to get a finer time resolution (although
there are drawbacks).  If this is possible then it is a much cleaner 
solution than the current method which varies the system clock frequency.

But I've only tested this on my computer, a K6, so I don't know how well
it can work on others....I'd be willing to make the preliminary code 
available, and to work on midi, mixer and sequencer emulation, etc, if 
there were sufficient interest.....

----------------------------------------------------
Robert Hamilton
r-hamilton@physics.tamu.edu     
