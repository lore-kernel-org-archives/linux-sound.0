From: Bill Nottingham <notting@redhat.com>
Date: Wed, 13 Jan 1999 16:18:31 +0000
Subject: Re: Yamaha opl3
Message-Id: <marc-linux-sound-91624637307855@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-90522162401464@msgid-missing>
In-Reply-To: <marc-linux-sound-90522162401464@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Eric Barendt (ebarendt@speedchoice.com) said: 
> Ok... I've been fighting with this on-board sound card since I installed
> linux a few months ago.. It's on my Tyan 1696 motherboard.  What do I
> need to do to get this sound card working? I've found things about
> compiling the opti something or other drivers into the kernel, but that
> didn't work (unless I did it wrong).  I also had some 3rd party
> software, which worked.. but I'd prefer to just have the kernel control
> everything.

Assuming it's an OPL3-SA2/3/x (most likely), you should be able
to configure the card with isapnptools and use the OPL3-SAx driver
in 2.1.late/2.2.0pre. (If you're using 2.2.0pre, you'd want to get
at least 2.2.0pre6, as that fixes bugs in the detection code, IIRC.)

Bill
