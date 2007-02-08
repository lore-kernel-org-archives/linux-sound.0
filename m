From: Jiri Kosina <jikos@jikos.cz>
Date: Thu, 08 Feb 2007 22:48:39 +0000
Subject: [PATCH] USB SOUND: usbaudio - remove urb->bandwidth reference
Message-Id: <Pine.LNX.4.64.0702082345460.25686@twin.jikos.cz>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Takashi Iwai <tiwai@suse.de>
Cc: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org

Hi,

Jeff spotted forgotten occurence of urb->bandwidth in isdn subsystem. When 
fixing it, I have done quick grep over the tree and found another one 
(which was even commented out). Let's just remove it.

[PATCH] USB SOUND: usbaudio - remove urb->bandwidth reference

Recent changes in usbcore removed the bandwidth field from struct urb.
Remove the occurence in usbaudio.c

Signed-off-by: Jiri Kosina <jkosina@suse.cz>

---

 sound/usb/usbaudio.c |   10 ----------
 1 files changed, 0 insertions(+), 10 deletions(-)

diff --git a/sound/usb/usbaudio.c b/sound/usb/usbaudio.c
index 19bdcc7..56fc9e9 100644
--- a/sound/usb/usbaudio.c
+++ b/sound/usb/usbaudio.c
@@ -324,16 +324,6 @@ static int prepare_capture_urb(struct snd_usb_substream *subs,
 	}
 	urb->transfer_buffer_length = offs;
 	urb->number_of_packets = ctx->packets;
-#if 0 // for check
-	if (! urb->bandwidth) {
-		int bustime;
-		bustime = usb_check_bandwidth(urb->dev, urb);
-		if (bustime < 0)
-			return bustime;
-		printk("urb %d: bandwidth = %d (packets = %d)\n", ctx->index, bustime, urb->number_of_packets);
-		usb_claim_bandwidth(urb->dev, urb, bustime, 1);
-	}
-#endif // for check
 	return 0;
 }
 

-- 
Jiri Kosina
