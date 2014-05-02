From: Sander Eikelenboom <linux@eikelenboom.it>
Date: Fri, 02 May 2014 13:09:26 +0000
Subject: [PATCH] Prevent printk ratelimiting from spamming kernel log while DEBUG not defined
Message-Id: <1399036167-6203-1-git-send-email-linux@eikelenboom.it>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Takashi Iwai <tiwai@suse.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Julia Lawall <julia.lawall@lip6.fr>
Cc: Sander Eikelenboom <linux@eikelenboom.it>, linux-sound@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>

Hi All,

This patch is for USB sound, but the construction is widely used in the kernel,
so this could pop up in more places.

Greg, Julia,

Would it be worthwhile to sweep this tree wide ?
And would this be something for Coccinelle ?
This probably also goes for the other loglevels and the "net" variant.


Sander Eikelenboom (1):
  Sound USB: Prevent printk ratelimiting from spamming kernel log while
    DEBUG not defined

 sound/usb/pcm.c |    5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

-- 
1.7.10.4

