From: Bo Shen <voice.shen@atmel.com>
Date: Fri, 14 Sep 2012 08:09:09 +0000
Subject: [PATCH] ASoC: wm8904: correct the index
Message-Id: <1347610149-8377-1-git-send-email-voice.shen@atmel.com>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: broonie@opensource.wolfsonmicro.com
Cc: alsa-devel@alsa-project.org, Bo Shen <voice.shen@atmel.com>, linux-sound@vger.kernel.org


Signed-off-by: Bo Shen <voice.shen@atmel.com>
---
 sound/soc/codecs/wm8904.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/sound/soc/codecs/wm8904.c b/sound/soc/codecs/wm8904.c
index 65d525d..13e8222 100644
--- a/sound/soc/codecs/wm8904.c
+++ b/sound/soc/codecs/wm8904.c
@@ -100,7 +100,7 @@ static const struct reg_default wm8904_reg_defaults[] = {
 	{ 14,  0x0000 },     /* R14  - Power Management 2 */
 	{ 15,  0x0000 },     /* R15  - Power Management 3 */
 	{ 18,  0x0000 },     /* R18  - Power Management 6 */
-	{ 19,  0x945E },     /* R20  - Clock Rates 0 */
+	{ 20,  0x945E },     /* R20  - Clock Rates 0 */
 	{ 21,  0x0C05 },     /* R21  - Clock Rates 1 */
 	{ 22,  0x0006 },     /* R22  - Clock Rates 2 */
 	{ 24,  0x0050 },     /* R24  - Audio Interface 0 */
-- 
1.7.9.5

