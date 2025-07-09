Received: from out-186.mta0.migadu.com (out-186.mta0.migadu.com [91.218.175.186])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCFB2C187
	for <linux-sound@vger.kernel.org>; Wed,  9 Jul 2025 12:47:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.186
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752065254; cv=none; b=jhDaWeQ9OBDPxGOabbLS/abXGAtRkha597eecKzssrBe69nwHkKVxupW5U550yF9wJwmX7JSJFYfVrc81xSvzJ80gf3XMIgyG18Qars425nKPEW73l0Tp7ZlwV0IAnn4iDpRJ+pYGXthHEHG0+yqquD310LplvOQ4AJPu0zMiks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752065254; c=relaxed/simple;
	bh=y4NrmxktK96RvpueAIOtkQgDlv4tt+9si4kpOaLhKrk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jlRzn7SniYPSK3IJ5zGE6XxtI5aVChzSje8mP9eMUa9copHraicKHbmdvHhH0wCwEi6wA/HOHREBDf9TZhRyfcCuYKygVKEeYrtM0MAhSpX0lGu18FUjaLtXMVuMMhf1hrrg1XEOGsGia0uQM1MKFXhCvTW9VKe4/hnATKqAnFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=r3K1GZtF; arc=none smtp.client-ip=91.218.175.186
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="r3K1GZtF"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1752065240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=RPgHFEL7MONUQhUTsvtqoOvB09WJYipCR6ISmSzlGHg=;
	b=r3K1GZtFCwiP0TZnff/qWHSdc3h7HujXstvuqvO3QIoxmnbpjRMSeSECMgAJ3mRlsl2TpG
	5W3UnYfDcunr3yjcu73mqsmLjUGQFcPybd5/WbYJNxKsVZU/eeUYgGfJbWj9T5/wf0NNmx
	uyyirOiSuSPDyCcFtM0x3p+kCctK5nw=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Philipp Stanner <phasta@kernel.org>,
	Andres Urian Florez <andres.emb.sys@gmail.com>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	Takashi Iwai <tiwai@suse.de>,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ALSA: echoaudio: Replace deprecated strcpy() with strscpy()
Date: Wed,  9 Jul 2025 14:46:52 +0200
Message-ID: <20250709124655.1195-1-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

strcpy() is deprecated; use strscpy() instead.

No functional changes intended.

Link: https://github.com/KSPP/linux/issues/88
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 sound/pci/echoaudio/echoaudio.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/sound/pci/echoaudio/echoaudio.c b/sound/pci/echoaudio/echoaudio.c
index 80d8ce75fdbb..2b33ef588ac3 100644
--- a/sound/pci/echoaudio/echoaudio.c
+++ b/sound/pci/echoaudio/echoaudio.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/module.h>
+#include <linux/string.h>
 
 MODULE_AUTHOR("Giuliano Pochini <pochini@shiny.it>");
 MODULE_LICENSE("GPL v2");
@@ -916,7 +917,7 @@ static int snd_echo_new_pcm(struct echoaudio *chip)
 		return err;
 	pcm->private_data = chip;
 	chip->analog_pcm = pcm;
-	strcpy(pcm->name, chip->card->shortname);
+	strscpy(pcm->name, chip->card->shortname);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &analog_playback_ops);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &analog_capture_ops);
 	snd_echo_preallocate_pages(pcm, &chip->pci->dev);
@@ -929,7 +930,7 @@ static int snd_echo_new_pcm(struct echoaudio *chip)
 		return err;
 	pcm->private_data = chip;
 	chip->digital_pcm = pcm;
-	strcpy(pcm->name, chip->card->shortname);
+	strscpy(pcm->name, chip->card->shortname);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &digital_capture_ops);
 	snd_echo_preallocate_pages(pcm, &chip->pci->dev);
 #endif /* ECHOCARD_HAS_DIGITAL_IO */
@@ -949,7 +950,7 @@ static int snd_echo_new_pcm(struct echoaudio *chip)
 		return err;
 	pcm->private_data = chip;
 	chip->analog_pcm = pcm;
-	strcpy(pcm->name, chip->card->shortname);
+	strscpy(pcm->name, chip->card->shortname);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &analog_playback_ops);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &analog_capture_ops);
 	snd_echo_preallocate_pages(pcm, &chip->pci->dev);
@@ -963,7 +964,7 @@ static int snd_echo_new_pcm(struct echoaudio *chip)
 		return err;
 	pcm->private_data = chip;
 	chip->digital_pcm = pcm;
-	strcpy(pcm->name, chip->card->shortname);
+	strscpy(pcm->name, chip->card->shortname);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_PLAYBACK, &digital_playback_ops);
 	snd_pcm_set_ops(pcm, SNDRV_PCM_STREAM_CAPTURE, &digital_capture_ops);
 	snd_echo_preallocate_pages(pcm, &chip->pci->dev);
@@ -1985,8 +1986,8 @@ static int __snd_echo_probe(struct pci_dev *pci,
 	if (err < 0)
 		return err;
 
-	strcpy(card->driver, "Echo_" ECHOCARD_NAME);
-	strcpy(card->shortname, chip->card_name);
+	strscpy(card->driver, "Echo_" ECHOCARD_NAME);
+	strscpy(card->shortname, chip->card_name);
 
 	dsp = "56301";
 	if (pci_id->device == 0x3410)
-- 
2.50.0

