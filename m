From: <mingo@chiara.csoma.elte.hu>
Date: Sat, 11 Sep 1999 15:46:01 +0000
Subject: Re: low-latency benchmarks: excellent results of RTC clock + SIGIO
Message-Id: <marc-linux-sound-93706522629904@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-93706455029492@msgid-missing>
In-Reply-To: <marc-linux-sound-93706455029492@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org


On Sat, 11 Sep 1999, Benno Senoner wrote:

> Seems that under high disk I/O load,
> (very seldom, about every 30-100secs) the process
> gets woken up one IRQ period later.
> Ideas why this happens.

this could be a lost RTC IRQ. If you are using 2048 Hz RTC interrupts, it
just needs a single 1msec IRQ delay to lose an RTC IRQ. Especially SCSI
disk interrupts are known to sometimes cause 1-2 millisecs IRQ delays.  
But before jumping to conclusions, what exactly are the symptoms, what
does 'one IRQ period later' mean exactly?

-- mingo
