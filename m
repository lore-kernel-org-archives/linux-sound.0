From: Bill Nottingham <notting@redhat.com>
Date: Mon, 16 Jul 2001 20:06:03 +0000
Subject: Re: SoundBlaster PCI128?
Message-Id: <marc-linux-sound-99531401006917@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
References: <marc-linux-sound-99531378505973@msgid-missing>
In-Reply-To: <marc-linux-sound-99531378505973@msgid-missing>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hal MacArgle (haltec@iceweb.net) said: 
> Greetings: Read that Linux supports the SB PCI128 card but I'm stuck
> trying to install the driver modules.. sb.o - awe_wave.o - and several
> others won't "take."

Wrong modules.

Use the es1371 (or possibly es1370) modules.

Bill
-
To unsubscribe from this list: send the line "unsubscribe linux-sound" in
the body of a message to majordomo@vger.kernel.org
