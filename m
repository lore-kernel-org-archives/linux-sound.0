From: Alan Cox <alan@lxorguk.ukuu.org.uk>
Date: Thu, 17 Jun 1999 22:13:41 +0000
Subject: Re: New scheduling latencies during audio playing + heavy disk I/O on various kernels
Message-Id: <marc-linux-sound-92965850729139@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92948447502258@msgid-missing>
In-Reply-To: <marc-linux-sound-92948447502258@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

> Alan, do you know if MIDI I/O or serial I/O suffer of high scheduling
> latencies in a similar manner like audio I/O when heavy disk I/O is performed ?

I would expect them to show similar latencies to the app in such cases when 
heavy disk I/O occured

> what if the note is read from a MIDI interface connected to a standard serial
> port ? ( are there some disadvantages over the soundcard's own MIDI port ?)

You would want to set the low latency flags on the serial port. The serial
code by default does processing 100 times a second in batches

Alan
