Received: from mail.auroraos.dev (unknown [95.181.193.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36D811C28E
	for <linux-sound@vger.kernel.org>; Tue,  3 Feb 2026 16:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.181.193.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770135408; cv=none; b=fRnOEsqdJJ7LSaAmQDN777WGgFoAn3MmymXVpRbCl7rv2+/q9LgCnqFOKbRh2f00ZCf5N2Lh3eB3qRJruwff+cCSOp4qYzOmOlpyUAoW7ZsndZUFjo+qmwpthPpRzHyW2cnWaE2/niyyKjD1oiWgu0Kvc+aB9NKrpqenklGh64s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770135408; c=relaxed/simple;
	bh=JyjarmFMc9nb+WeTnDJlpPyviiO3lRQaee0ztJIBT4c=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=l251Sgrlgo4VLmSg8DgAj/df533XQZNhUMNu2efmsDyzROycdLjCODBBqmNThK85DVJ3V/oVZg4+LAc2QFf53coEF2q++LPn3ENLBvDreZN+oQeqnPj4FEH5jJd76h3Y2OffqHNBlppbThbTJgcp/KCmgyA7/2DdOQFUF2TdqhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev; spf=pass smtp.mailfrom=auroraos.dev; arc=none smtp.client-ip=95.181.193.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=auroraos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=auroraos.dev
Received: from wasted (213.87.144.85) by exch16.corp.auroraos.dev
 (10.189.209.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.1847.3; Tue, 3 Feb 2026
 19:16:34 +0300
From: Sergey Shtylyov <s.shtylyov@auroraos.dev>
To: Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	<linux-sound@vger.kernel.org>
CC: Sergey Shtylyov <s.shtylyov@auroraos.dev>, Mathieu Bouffard
	<mbouffard@strangequarks.org>
Subject: [PATCH] ALSA: usb-audio: fix broken logic in snd_audigy2nx_led_update()
Date: Tue, 3 Feb 2026 19:15:57 +0300
Message-ID: <20260203161558.18680-1-s.shtylyov@auroraos.dev>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: exch16.corp.auroraos.dev (10.189.209.38) To
 exch16.corp.auroraos.dev (10.189.209.38)

When the support for the Sound Blaster X-Fi Surround 5.1 Pro was added,
the existing logic for the X-Fi Surround 5.1 in snd_audigy2nx_led_put()
was broken due to missing *else* before the added *if*: snd_usb_ctl_msg()
became incorrectly called twice and an error from first snd_usb_ctl_msg()
call ignored.  As the added snd_usb_ctl_msg() call was totally identical
to the existing one for the "plain" X-Fi Surround 5.1, just merge those
two *if* statements while fixing the broken logic...

Found by Linux Verification Center (linuxtesting.org) with the Svace static
analysis tool.

Fixes: 7cdd8d73139e ("ALSA: usb-audio - Add support for USB X-Fi S51 Pro")
Signed-off-by: Sergey Shtylyov <s.shtylyov@auroraos.dev>

---
This patch is against the master branch of Takashi Iwai's sound.git repo...

 sound/usb/mixer_quirks.c | 9 ++-------
 1 file changed, 2 insertions(+), 7 deletions(-)

diff --git a/sound/usb/mixer_quirks.c b/sound/usb/mixer_quirks.c
index 07d5cf0077d8..ec65e8a71919 100644
--- a/sound/usb/mixer_quirks.c
+++ b/sound/usb/mixer_quirks.c
@@ -311,13 +311,8 @@ static int snd_audigy2nx_led_update(struct usb_mixer_interface *mixer,
 	if (pm.err < 0)
 		return pm.err;
 
-	if (chip->usb_id == USB_ID(0x041e, 0x3042))
-		err = snd_usb_ctl_msg(chip->dev,
-				      usb_sndctrlpipe(chip->dev, 0), 0x24,
-				      USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_OTHER,
-				      !value, 0, NULL, 0);
-	/* USB X-Fi S51 Pro */
-	if (chip->usb_id == USB_ID(0x041e, 0x30df))
+	if (chip->usb_id == USB_ID(0x041e, 0x3042) ||	/* USB X-Fi S51 */
+	    chip->usb_id == USB_ID(0x041e, 0x30df))	/* USB X-Fi S51 Pro */
 		err = snd_usb_ctl_msg(chip->dev,
 				      usb_sndctrlpipe(chip->dev, 0), 0x24,
 				      USB_DIR_OUT | USB_TYPE_VENDOR | USB_RECIP_OTHER,
-- 
2.52.0
