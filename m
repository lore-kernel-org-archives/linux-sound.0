From: David Nedved <dnedved@nuvox.net>
Date: Thu, 12 Jul 2001 20:56:58 +0000
Subject: How to set gain?
Message-Id: <marc-linux-sound-99497172206206@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi All,

Quick question: how do I set the gain on my sound system?  I'm using mpg123
to play mp3's (in remote mode) and want to be able to vary the volume.  I
think I see how to do it in the opl3sa2 driver code, but I would prefer an
easier and more generic way (so that it will work with any sound card).

I looked for a generic oss.c, oss.h, mixer.c, mixer.h file in the sound
drivers directory of the kernel (2.4.4) but didn't see anything other than
specific drivers for specific cards.  I'm looking for the cleanest most
generic way that makes sense...

A pointer would be very helpful, a code snippet would be a gift from the gods!

Thanks in advance,

David
-
To unsubscribe from this list: send the line "unsubscribe linux-sound" in
the body of a message to majordomo@vger.kernel.org
