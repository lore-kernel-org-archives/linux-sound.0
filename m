From: Bill Nottingham <notting@redhat.com>
Date: Fri, 25 Feb 2000 02:51:34 +0000
Subject: Re: Yamaha YMF724 (fwd)
Message-Id: <marc-linux-sound-95145640024677@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-95144195916110@msgid-missing>
In-Reply-To: <marc-linux-sound-95144195916110@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Michael Black (dx@mdk.c7.utcluj.ro) said: 
>   Please make some light here. :) Wat I'm doing wrong?

You're trying to use drivers that won't work. The Yamaha
PCI cards have nothing in common with the OPL3-SAx cards.

They currently are completely unsupported, and will remain
that way until Yamaha decides to actually release programming
documentation; they have shown zero interest in doing so.

Bill
