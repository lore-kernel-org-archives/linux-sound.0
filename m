From: Bill Nottingham <notting@redhat.com>
Date: Mon, 17 May 1999 15:11:06 +0000
Subject: Re: SB AWE32 & RH 6.0, MIDI not working!
Message-Id: <marc-linux-sound-92699179420462@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-92692079727967@msgid-missing>
In-Reply-To: <marc-linux-sound-92692079727967@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Ricardo Peres (rjperes@student.dei.uc.pt) said: 
> alias sbawe awe_wave
> options -k awe_wave io=0x620

Actually, you don't need to specify an io port here for the awe module.

Add after this line in your isapnp.conf file:
>  (IO 0 (SIZE 4) (BASE 0x0620))
(IO 1 (SIZE 4) (BASE 0x0A20))
(IO 2 (SIZE 4) (BASE 0x0E20))

Then re-run isapnp and try to load the module - does that
help?

Bill
