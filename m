From: Samuel Thibault <Samuel.Thibault@ens-lyon.fr>
Date: Sat, 12 Jul 2003 01:14:29 +0000
Subject: [PATCH] [2.5] maestro volume tuning
Message-Id: <marc-linux-sound-105797265328435@msgid-missing>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-sound@vger.kernel.org

Hi,

Here is a patch which tunes the volume control of maestro sound boards:
The log conversion seems not good for PCM and CD. The volume buttons
incrementing / decrementing the main volume by 10 on 100 is too much, I'd
rather set it to 5.

Regards,
Samuel Thibault

diff -ur linux-2.5.71-orig/sound/oss/maestro.c linux-2.5.71-perso/sound/oss/maestro.c
--- linux-2.5.71-orig/sound/oss/maestro.c	2003-06-14 17:13:46.000000000 -0400
+++ linux-2.5.71-perso/sound/oss/maestro.c	2003-07-06 13:51:23.000000000 -0400
@@ -726,6 +726,12 @@
 			left = (left * mh->scale) / 100;
 			if ((left = 0) && (right = 0))
 				val |= 0x8000;
+		} else if (mixer = SOUND_MIXER_PCM || mixer = SOUND_MIXER_CD) {
+			/* log conversion seems bad for them */
+			if ((left = 0) && (right = 0))
+				val = 0x8000;
+			right = ((100 - right) * mh->scale) / 100;
+			left = ((100 - left) * mh->scale) / 100;
 		} else {
 			/* log conversion for the stereo controls */
 			if((left = 0) && (right = 0))
@@ -1937,12 +1943,12 @@
 		   manner by adjusting the master mixer volume. */
 		volume = c->mix.mixer_state[0] & 0xff;
 		if (vol_evt = UP_EVT) {
-			volume += 10;
+			volume += 5;
 			if (volume > 100)
 				volume = 100;
 		}
 		else if (vol_evt = DOWN_EVT) {
-			volume -= 10;
+			volume -= 5;
 			if (volume < 0)
 				volume = 0;
 		} else {
