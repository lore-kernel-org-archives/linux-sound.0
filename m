From: Lubomir Rintel <lkundrak@v3.sk>
Date: Mon, 16 Mar 2009 10:01:49 +0000
Subject: [PATCH] Fix NULL dereference when suspending snd_opl3sa2
Message-Id: <1237197709.7210.2.camel@localhost.localdomain>
List-Id: <linux-sound.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: quoted-printable
To: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-sound@vger.kernel.org
Cc: Krzysztof Helt <krzysztof.h1@wp.pl>, stable@kernel.org, Andrew Morton <akpm@linux-foundation.org>

This should fix the following OOPS:
http://www.kerneloops.org/raw.php?rawid=80591&msgid
Signed-off-by: Lubomir Rintel <lkundrak@v3.sk>
---
 sound/isa/opl3sa2.c |    3 ++-
 1 files changed, 2 insertions(+), 1 deletions(-)

diff --git a/sound/isa/opl3sa2.c b/sound/isa/opl3sa2.c
index 58c972b..483c284 100644
--- a/sound/isa/opl3sa2.c
+++ b/sound/isa/opl3sa2.c
@@ -553,7 +553,8 @@ static int snd_opl3sa2_suspend(struct snd_card
*card, pm_message_t state)
 	struct snd_opl3sa2 *chip =3D card->private_data;
=20
 	snd_power_change_state(card, SNDRV_CTL_POWER_D3hot);
-	chip->wss->suspend(chip->wss);
+	if (chip->wss->suspend)
+		chip->wss->suspend(chip->wss);
 	/* power down */
 	snd_opl3sa2_write(chip, OPL3SA2_PM_CTRL, OPL3SA2_PM_D3);
=20
--=20
1.5.5.6



