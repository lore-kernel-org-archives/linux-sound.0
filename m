From: Christian Gromm <christian.gromm@microchip.com>
Date: Wed, 04 Nov 2020 12:50:42 +0000
Subject: [PATCH v2] drivers: staging: most: use swabXX functions of kernel
Message-Id: <1604494242-3414-1-git-send-email-christian.gromm@microchip.com>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gregkh@linuxfoundation.org
Cc: Christian Gromm <christian.gromm@microchip.com>, driverdev-devel@linuxdriverproject.org, linux-sound@vger.kernel.org

This patch makes use of the swab16() and swab32() functions available
in the kernel instead of using own implementations.

Signed-off-by: Christian Gromm <christian.gromm@microchip.com>
Reported-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
v2: added 'Reported-by:' tag

 drivers/staging/most/sound/sound.c | 14 ++------------
 1 file changed, 2 insertions(+), 12 deletions(-)

diff --git a/drivers/staging/most/sound/sound.c b/drivers/staging/most/sound/sound.c
index 8a449ab..3a1a590 100644
--- a/drivers/staging/most/sound/sound.c
+++ b/drivers/staging/most/sound/sound.c
@@ -72,22 +72,12 @@ static struct list_head adpt_list;
 		       SNDRV_PCM_INFO_INTERLEAVED | \
 		       SNDRV_PCM_INFO_BLOCK_TRANSFER)
 
-#define swap16(val) ( \
-	(((u16)(val) << 8) & (u16)0xFF00) | \
-	(((u16)(val) >> 8) & (u16)0x00FF))
-
-#define swap32(val) ( \
-	(((u32)(val) << 24) & (u32)0xFF000000) | \
-	(((u32)(val) <<  8) & (u32)0x00FF0000) | \
-	(((u32)(val) >>  8) & (u32)0x0000FF00) | \
-	(((u32)(val) >> 24) & (u32)0x000000FF))
-
 static void swap_copy16(u16 *dest, const u16 *source, unsigned int bytes)
 {
 	unsigned int i = 0;
 
 	while (i < (bytes / 2)) {
-		dest[i] = swap16(source[i]);
+		dest[i] = swab16(source[i]);
 		i++;
 	}
 }
@@ -109,7 +99,7 @@ static void swap_copy32(u32 *dest, const u32 *source, unsigned int bytes)
 	unsigned int i = 0;
 
 	while (i < bytes / 4) {
-		dest[i] = swap32(source[i]);
+		dest[i] = swab32(source[i]);
 		i++;
 	}
 }
-- 
2.7.4
