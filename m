Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7BB3F8EDC
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 10:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692447; cv=none; b=ilp8d4tPBgEewO8WFJVhaCSmk3+D3Dj0p1feMLEEMOH9kmPwSefwXH7cqf5PQa9xaqgRn6lTznCFbfzOJ+zZG/It4scEJFsWD8vlV/YjxpNLgEr/GNk8/xOC6JGH6bk5+7WSaNXtMidjKEBWKbUYV7Im+7eNckW0HahJ10pfzcs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692447; c=relaxed/simple;
	bh=0VKFkNlEKDw288PdSdXQHhZ6q0aNgLP3kbBRSkQ53io=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cUSKKB0pg2NityxwsXeVi/HOj3caxhx8UabwCQ1IS/D1FmnoIZ0iGezmGJ3q7hqOpeUu/rW9RxBg7MB6vR5Nww5s/W0eu7qMZsOzspYmS4UX9KV55a+zi/M3FjdH0k1oNpFjW1p3LA57omfPNU0gUdINqCHGide0r+cm843vYRc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sLCHEUTh; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sLCHEUTh"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-137335bc3caso6882267c88.0
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 03:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692445; x=1782297245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yrGTC5BuLCcleWlyDxhfzmeV1rXl6zWQpWVZTTauIJk=;
        b=sLCHEUTh/sM1p1b7zaued3tAOgbVZn5Nl6hBsNqKWIEMTcPZiNDcFVfnAbVCkWesZU
         +7GfExcqtrg8pgV7j7UZP5Em1dMLD71Brpfr0DkE6qbueXBqHiAU0ZjNkTQNKnrf9Ke8
         ZsB0gffIat204H47eOJqL7bmXcNTCWBEJnTxvqYfBpRzNkYmO+uYsp0Q9uWUaVDJYqq/
         TcUiSwT4sDe59veHKQ3Zd1jO24qKJ7DfFFvsJ6845zYJnZlWOg/T6FYiYUmamQG2LLUl
         aLIvJELcfdi7NO1qn6cVtuQzH48HURjz7xBvFGuKT29EfgncgMC4oMST3P8aFjLL2fp3
         rIkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692445; x=1782297245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yrGTC5BuLCcleWlyDxhfzmeV1rXl6zWQpWVZTTauIJk=;
        b=R6TfxBK9+pxvhz/xmrMKytf3j9G/1LC7b1FxcbAz+oLv/KER2t4D72rgpcGLbKHOxs
         6cAIuB4Q7tuI/3429fJDTbZd5yYR9+HNhIj49IokSMMV/HtLdSk6PvPalVFI9UGm/dBe
         tblUKmsRI7KtxRcHzMQfG/BUcEbVUFvIEDwmc8ahRpSPgBgPte46/0h9BzmBOM3ozecF
         Mtvv2lpYV2L83FbJe1TCABfUbEw30E8aYETN6/j0IGVMpCAywm1yaXwyFdnKYylvj6ZL
         cX9BUHW/SmqanX3NPG4AVnSF8BDGh0lqxu79ox1zAtA3AmtzqIBGsjYBf88tRsc3nUj/
         863w==
X-Forwarded-Encrypted: i=1; AFNElJ/smMhmQF++MKlws1zSVBPQMnD2CZ06pdOKGsoUWRrMtq2cnMv+9IOh45+KFom5s08KL1JOWTVI5CRErg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywwd4Ikk7FGHa0A+qfHEbW0GAU2BUshpc6sFDIOXei3bbHMz0Zx
	fTYatyJ1p2+pndTkEpIWQLDtd4t0XRhNePuoP6bfj8cYO93w/V/5pkaK
X-Gm-Gg: AfdE7cnrHIc+QrSqnFlPXyImt6NfPOobrHQHmhO6lJGnSSQN0uvLd4fSISoHNToYkuE
	9QTVduaenGb29SxcQGi18nCEbGv1gafR3vlp7dcTsN9aJXQgbTHXfdNIWgzCfBBOdBleND2Kr1t
	ATQ2OiAmtwA14pgWZQkOXcunTjjlFnpDO6ZGPF73UzYY6Z/rsoXldVum5Zo04utt2vhayUccPd6
	WEDMOjI9ZB9HnRKHVLjr/LlP+15bB5RFrQsTGQ3SzIoCQGG6QkwEL64A5In0sKQcncH0e/VQqpq
	Or/GK7EfnDqtco+QhPQNH9zUcK+R+XGYCZglsy3aYSDG03ual6MiYNfqD5KqvRON4PMNXjZzJ7A
	GPj3n+mmPOcr2i24vEMXeNcaVivevCibhf0JUjhxEdmp72QMAEv964PnUR0z0RrIsM4wKxqIj73
	0b4sk2vwnnzg1qbJaOf9mHsN1yktIuTAjCldpOQnpsLjr8z+I=
X-Received: by 2002:a05:7300:ad24:b0:30b:c502:23cc with SMTP id 5a478bee46e88-30bca07744bmr1769706eec.17.1781692444831;
        Wed, 17 Jun 2026 03:34:04 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:34:04 -0700 (PDT)
From: phucduc.bui@gmail.com
To: Mark Brown <broonie@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cheng-Yi Chiang <cychiang@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Guenter Roeck <groeck@chromium.org>,
	Benson Leung <bleung@chromium.org>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	povik+lin@cutebit.org,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Support Opensource <support.opensource@diasemi.com>,
	Nick Li <nick.li@foursemi.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Srinivas Kandagatla <srini@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Shenghao Ding <shenghao-ding@ti.com>,
	Kevin Lu <kevin-lu@ti.com>,
	Baojun Xu <baojun.xu@ti.com>,
	Sen Wang <sen@ti.com>,
	Oder Chiou <oder_chiou@realtek.com>,
	Lars-Peter Clausen <lars@metafoo.de>,
	nuno.sa@analog.com,
	Steven Eckhoff <steven.eckhoff.opensource@gmail.com>,
	patches@opensource.cirrus.com,
	chrome-platform@lists.linux.dev,
	asahi@lists.linux.dev,
	linux-arm-msm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	bui duc phuc <phucduc.bui@gmail.com>
Subject: [PATCH 07/78] ASoC: codecs: aw88166: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:24 +0700
Message-ID: <20260617103235.449609-8-phucduc.bui@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260617103235.449609-1-phucduc.bui@gmail.com>
References: <20260617103235.449609-1-phucduc.bui@gmail.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: bui duc phuc <phucduc.bui@gmail.com>

Clean up the code using guard() for mutex locks.
Merely code refactoring, and no behavior change.

Signed-off-by: bui duc phuc <phucduc.bui@gmail.com>
---
 sound/soc/codecs/aw88166.c | 23 +++++++++--------------
 1 file changed, 9 insertions(+), 14 deletions(-)

diff --git a/sound/soc/codecs/aw88166.c b/sound/soc/codecs/aw88166.c
index 3f15f4ac51f7..aa37d1a3d1fa 100644
--- a/sound/soc/codecs/aw88166.c
+++ b/sound/soc/codecs/aw88166.c
@@ -1173,9 +1173,8 @@ static void aw88166_startup_work(struct work_struct *work)
 	struct aw88166 *aw88166 =
 		container_of(work, struct aw88166, start_work.work);
 
-	mutex_lock(&aw88166->lock);
+	guard(mutex)(&aw88166->lock);
 	aw88166_start_pa(aw88166);
-	mutex_unlock(&aw88166->lock);
 }
 
 static void aw88166_start(struct aw88166 *aw88166, bool sync_start)
@@ -1413,11 +1412,10 @@ static int aw88166_profile_set(struct snd_kcontrol *kcontrol,
 	struct aw88166 *aw88166 = snd_soc_component_get_drvdata(codec);
 	int ret;
 
-	mutex_lock(&aw88166->lock);
+	guard(mutex)(&aw88166->lock);
 	ret = aw88166_dev_set_profile_index(aw88166->aw_pa, ucontrol->value.integer.value[0]);
 	if (ret) {
 		dev_dbg(codec->dev, "profile index does not change");
-		mutex_unlock(&aw88166->lock);
 		return 0;
 	}
 
@@ -1426,8 +1424,6 @@ static int aw88166_profile_set(struct snd_kcontrol *kcontrol,
 		aw88166_start(aw88166, AW88166_SYNC_START);
 	}
 
-	mutex_unlock(&aw88166->lock);
-
 	return 1;
 }
 
@@ -1607,12 +1603,12 @@ static int aw88166_request_firmware_file(struct aw88166 *aw88166)
 		return ret;
 	}
 
-	mutex_lock(&aw88166->lock);
-	/* aw device init */
-	ret = aw88166_dev_init(aw88166, aw88166->aw_cfg);
-	if (ret)
-		dev_err(aw88166->aw_pa->dev, "dev init failed\n");
-	mutex_unlock(&aw88166->lock);
+	scoped_guard(mutex, &aw88166->lock) {
+		/* aw device init */
+		ret = aw88166_dev_init(aw88166, aw88166->aw_cfg);
+		if (ret)
+			dev_err(aw88166->aw_pa->dev, "dev init failed\n");
+	}
 
 	return ret;
 }
@@ -1639,7 +1635,7 @@ static int aw88166_playback_event(struct snd_soc_dapm_widget *w,
 	struct snd_soc_component *component = snd_soc_dapm_to_component(w->dapm);
 	struct aw88166 *aw88166 = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&aw88166->lock);
+	guard(mutex)(&aw88166->lock);
 	switch (event) {
 	case SND_SOC_DAPM_PRE_PMU:
 		aw88166_start(aw88166, AW88166_ASYNC_START);
@@ -1650,7 +1646,6 @@ static int aw88166_playback_event(struct snd_soc_dapm_widget *w,
 	default:
 		break;
 	}
-	mutex_unlock(&aw88166->lock);
 
 	return 0;
 }
-- 
2.43.0

