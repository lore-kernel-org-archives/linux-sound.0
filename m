From: Pavel Machek <pavel@bug.ucw.cz>
Date: Fri, 18 Jun 1999 10:00:01 +0000
Subject: Re: New scheduling latencies during audio playing + heavy disk I/O on various kernels
Message-Id: <marc-linux-sound-92978831031506@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92948447502258@msgid-missing>
In-Reply-To: <marc-linux-sound-92948447502258@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi!


> > what if the note is read from a MIDI interface connected to a standard serial
> > port ? ( are there some disadvantages over the soundcard's own MIDI port ?)
> 
> You would want to set the low latency flags on the serial port. The serial
> code by default does processing 100 times a second in batches

Well - other possibility is to set HZ to 1000 ;-).

									Pavel
-- 
I'm really pavel@ucw.cz. Look at http://195.113.31.123/~pavel.  Pavel
Hi! I'm a .signature virus! Copy me into your ~/.signature, please!
