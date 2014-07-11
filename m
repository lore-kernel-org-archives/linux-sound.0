From: Konstantinos Tsimpoukas <kostaslinuxxx@gmail.com>
Date: Fri, 11 Jul 2014 04:19:37 +0000
Subject: [PATCH 1/1] ice1712: check if snd card loaded, if not do not proceed
Message-Id: <1405052377-3096-1-git-send-email-kostaslinuxxx@gmail.com>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Konstantinos Tsimpoukas <kostaslinuxxx@gmail.com>, alsa-devel@alsa-project.org
Cc: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.de>, linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org

Just adding a simple if statement, which
verifies if actually card is loaded, if not
does not continue with the execution
of the snd_card_free.

Signed-off-by: Konstantinos Tsimpoukas <kostaslinuxxx@gmail.com>
---
 sound/pci/ice1712/ice1712.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/sound/pci/ice1712/ice1712.c b/sound/pci/ice1712/ice1712.c
index d9b9e45..431096b 100644
--- a/sound/pci/ice1712/ice1712.c
+++ b/sound/pci/ice1712/ice1712.c
@@ -2819,7 +2819,8 @@ static void snd_ice1712_remove(struct pci_dev *pci)
 
 	if (ice->card_info && ice->card_info->chip_exit)
 		ice->card_info->chip_exit(ice);
-	snd_card_free(card);
+	if (card)
+		snd_card_free(card);
 }
 
 #ifdef CONFIG_PM_SLEEP
-- 
1.9.1

