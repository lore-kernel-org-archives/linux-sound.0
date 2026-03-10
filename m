Received: from out-173.mta1.migadu.com (out-173.mta1.migadu.com [95.215.58.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22CCA29AAF7
	for <linux-sound@vger.kernel.org>; Tue, 10 Mar 2026 10:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773138607; cv=none; b=LAuazwnmwPyU58ITYHJcs0OKXUrd4O5n2VJCDz90DdhDJgnjz3Lj6sQkt/K5BfsSVJUyrpxeiK3ZisiQBjCDHc88DuRshxQvYflhtaqLo0wmJzi1oHeUC3NCIvlUW48pgP11ynMGBiAV8O30PNwEgizMxTmIbTzXlhD+iUVOqOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773138607; c=relaxed/simple;
	bh=PnfNLx9HNmk+snC3uutNYRIvphS+pIovbD4q3xU8mag=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Btn/eJZFP0zuHP63DxMwEBW4JeFc12iGZgAzlGJD+RlDjnhIb18tHY0Q+7mBrKR+6Xm5/f0pgjOo/7Cd/Iz5LoSY6+2S7r0P1C6l5OKCvEBJTyzRiKonKD0JgMTGLjESIFB3Uwal3/lbvMCYkxFsoFFV8lXX/VjmOB5EGCowXsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=G67fPErc; arc=none smtp.client-ip=95.215.58.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="G67fPErc"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1773138594;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=fv6YFRUsDV06wkSX3KXOKXjQRxlArAIWy+HcwNc0XJw=;
	b=G67fPErc8ib0AE4WdSF44K3UjNKPw6x4mS5Ahgb7x/yUlKieF6tz5PY17zp9sEi9eN82yE
	njs0oxaORP/ucGUcxR2BCsYcFDE/LQRqV4gOn+qt10LhXXmuRNX3bkvkMo/Hy6C2ek2YW3
	V/Fj5d7iLSjVLChE1Shz5VLx7hh06EA=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: Johannes Berg <johannes@sipsolutions.net>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kees Cook <kees@kernel.org>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	stable@vger.kernel.org,
	Takashi Iwai <tiwai@suse.de>,
	linuxppc-dev@lists.ozlabs.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] ALSA: aoa: Skip devices with no codecs in i2sbus_resume()
Date: Tue, 10 Mar 2026 11:29:20 +0100
Message-ID: <20260310102921.210109-3-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2923; i=thorsten.blum@linux.dev; h=from:subject; bh=PnfNLx9HNmk+snC3uutNYRIvphS+pIovbD4q3xU8mag=; b=kA0DAAoWXqtxINjMdS4ByyZiAGmv8oGijncZDUbv49ULrvxeC+UDjQ1uivJ6TSMh8x4hnXgnX 4h1BAAWCgAdFiEE4Jr4mE11fHmyNFi5XqtxINjMdS4FAmmv8oEACgkQXqtxINjMdS6uTQD+Kp// FSSw7mMOZNBYb3fSW1OYnYNgf0wioNwpAZnpTcQBAIfHvYiZrfP/U8GZ8CvXQiGWGuco67cbHwV iUH3Nu/4F
X-Developer-Key: i=thorsten.blum@linux.dev; a=openpgp; fpr=1D60735E8AEF3BE473B69D84733678FD8DFEEAD4
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

In i2sbus_resume(), skip devices with an empty codec list, which avoids
using an uninitialized 'sysclock_factor' in the 32-bit format path in
i2sbus_pcm_prepare().

In i2sbus_pcm_prepare(), replace two list_for_each_entry() loops with a
single list_first_entry() now that the codec list is guaranteed to be
non-empty by all callers.

Fixes: f3d9478b2ce4 ("[ALSA] snd-aoa: add snd-aoa")
Cc: stable@vger.kernel.org
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
Changes in v2:
- Skip devices with no codecs in i2sbus_resume() and use
  list_first_entry() in i2sbus_pcm_prepare() now that the codec list is
  guaranteed to be non-empty by all callers (Takashi)
- Link to v1: https://lore.kernel.org/lkml/20260309114159.765304-3-thorsten.blum@linux.dev/
---
 sound/aoa/soundbus/i2sbus/core.c |  3 +++
 sound/aoa/soundbus/i2sbus/pcm.c  | 16 +++++-----------
 2 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/sound/aoa/soundbus/i2sbus/core.c b/sound/aoa/soundbus/i2sbus/core.c
index f974b96e98cd..22c956267f4e 100644
--- a/sound/aoa/soundbus/i2sbus/core.c
+++ b/sound/aoa/soundbus/i2sbus/core.c
@@ -405,6 +405,9 @@ static int i2sbus_resume(struct macio_dev* dev)
 	int err, ret = 0;
 
 	list_for_each_entry(i2sdev, &control->list, item) {
+		if (list_empty(&i2sdev->sound.codec_list))
+			continue;
+
 		/* reset i2s bus format etc. */
 		i2sbus_pcm_prepare_both(i2sdev);
 
diff --git a/sound/aoa/soundbus/i2sbus/pcm.c b/sound/aoa/soundbus/i2sbus/pcm.c
index aff99003d833..97c807e67d56 100644
--- a/sound/aoa/soundbus/i2sbus/pcm.c
+++ b/sound/aoa/soundbus/i2sbus/pcm.c
@@ -383,6 +383,9 @@ static int i2sbus_pcm_prepare(struct i2sbus_dev *i2sdev, int in)
 	/* set stop command */
 	command->command = cpu_to_le16(DBDMA_STOP);
 
+	cii = list_first_entry(&i2sdev->sound.codec_list,
+			       struct codec_info_item, list);
+
 	/* ok, let's set the serial format and stuff */
 	switch (runtime->format) {
 	/* 16 bit formats */
@@ -390,13 +393,7 @@ static int i2sbus_pcm_prepare(struct i2sbus_dev *i2sdev, int in)
 	case SNDRV_PCM_FORMAT_U16_BE:
 		/* FIXME: if we add different bus factors we need to
 		 * do more here!! */
-		bi.bus_factor = 0;
-		list_for_each_entry(cii, &i2sdev->sound.codec_list, list) {
-			bi.bus_factor = cii->codec->bus_factor;
-			break;
-		}
-		if (!bi.bus_factor)
-			return -ENODEV;
+		bi.bus_factor = cii->codec->bus_factor;
 		input_16bit = 1;
 		break;
 	case SNDRV_PCM_FORMAT_S32_BE:
@@ -410,10 +407,7 @@ static int i2sbus_pcm_prepare(struct i2sbus_dev *i2sdev, int in)
 		return -EINVAL;
 	}
 	/* we assume all sysclocks are the same! */
-	list_for_each_entry(cii, &i2sdev->sound.codec_list, list) {
-		bi.sysclock_factor = cii->codec->sysclock_factor;
-		break;
-	}
+	bi.sysclock_factor = cii->codec->sysclock_factor;
 
 	if (clock_and_divisors(bi.sysclock_factor,
 			       bi.bus_factor,
