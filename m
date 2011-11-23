From: voice <voice.shen@atmel.com>
Date: Wed, 23 Nov 2011 10:05:01 +0000
Subject: [PATCH] atmel ac97c: using software reset instead hardware reset if not available
Message-Id: <1322042701-32100-1-git-send-email-voice.shen@atmel.com>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org
Cc: Nicolas.Ferre@atmel.com, JM.Lin@atmel.com, Hong.Xu@atmel.com, voice <voice.shen@atmel.com>

Using software reset instead hardware reset if not available

Signed-off-by: Bo Shen <voice.shen@atmel.com>
---
 sound/atmel/ac97c.c |    4 ++++
 1 files changed, 4 insertions(+), 0 deletions(-)

diff --git a/sound/atmel/ac97c.c b/sound/atmel/ac97c.c
index 6e5adde..73516f6 100644
--- a/sound/atmel/ac97c.c
+++ b/sound/atmel/ac97c.c
@@ -899,6 +899,10 @@ static void atmel_ac97c_reset(struct atmel_ac97c *chip)
 		/* AC97 v2.2 specifications says minimum 1 us. */
 		udelay(2);
 		gpio_set_value(chip->reset_pin, 1);
+	} else {
+		ac97c_writel(chip, MR, AC97C_MR_WRST | AC97C_MR_ENA);
+		udelay(2);
+		ac97c_writel(chip, MR, AC97C_MR_ENA);
 	}
 }
 
-- 
1.6.3.3

