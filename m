Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F513FBED7
	for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 10:38:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781692739; cv=none; b=OKgJmWZihs1O5WmF10tkSImpF+UFN2ikTQVgswlqtfuIC97FjFpu3TaIMGKw2rVPuE8E6Zq9q2+dtOUSOE9zfOzQ8ZGyepDHwo9YPgzFScT+7CkUyUlKxFU0d3L8gAxw9Md+uX2uSWnJ4tr+DbKuaTgiocHnvc2HG8bxD404pZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781692739; c=relaxed/simple;
	bh=NLE+EBpHa+LlzJ3PP970fGwtuk6PJS4PH4FnLXZPSYo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tP5X5Ok/G0tQI/IHw0QA3OuOfVpfcNJr4oL7VDKp/iWr16hKPdPNOXxwBzLmwYmtUproEKQV5DigTvajprsLdsKPviYpuSVh2eZFl5UFPUhKti4x3eFCcqiIv+S7j25W5iQlirWeX/jlV1A3alWeiMVozItJuYql10Ac47DPmvQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EZ5x65ln; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EZ5x65ln"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-304d8362a58so603294eec.1
        for <linux-sound@vger.kernel.org>; Wed, 17 Jun 2026 03:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781692738; x=1782297538; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=epc5Wva+vACuqNkvuJqfLpmPSMQ45/U3Q2IUahrXd8Y=;
        b=EZ5x65lnQM+n23tlp9JMQJ6wkpg3twB8QL2YQIJNju3XT16zV3IGxl2StLrGNJsUyT
         pQYOHG7t9WNdKdyFLlpmj22LJX4CdLgb7CWzKRFYbgS+oqhvtWj63c5DK228GVX169xs
         BejRamERD/Hw+vV5wCRAW9q1kgu4lpRff8Q3TGRktFXfSdMaUWD4RMygTYL0JIqPWCwJ
         cTFWQHxyKzvingFzoyJknNXv9w5NlSh/CsWyLe9hanav98hW0B/CzGDrCGn3vcXF/dKy
         xvST7HQ6aNiNiwi7BxFm6x4i0PUG38QhumDmYg5EpeDJpZwJUej552IOth0LHaJNSfhu
         TQhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781692738; x=1782297538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=epc5Wva+vACuqNkvuJqfLpmPSMQ45/U3Q2IUahrXd8Y=;
        b=eZlsBNnvpMOjitTWTI//l5KS0GD/DNWA9tdjmOZlkkB2B2aa29mofniVKu9cVmKmJc
         q7HEbg022PB+ztReXTtLyIBD07IahrfMaml38K3M1emPiP8SAsk3Fk4u8BoSHWKHan10
         rsUG+RD2VvsTlDbchZ9sfBP78pIHcc0X++Fon67lMUKuSWGoDZiz5Te6gWmWkrqUmn8K
         S1Mbh2KWe1lzYFVxE3thN8gsg+bD5rBlCIC8U/ZzhE1KsXWN/v60b1+aGgm652mjk/E2
         9+KLp/zCAkelO8gG2vgPooDNa6G4QI8yvDhA1mBthA2kHQuszs/BR9lxSQouZNwFViBz
         VrsQ==
X-Forwarded-Encrypted: i=1; AFNElJ/CFnSD0QAEFPS3IZQ5Zgg8Mf0Y3ynmQKJBz1z/9RiFqOcGv1ces36KureyXcdSLXYP2p9WpgrkGTf/Dg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh9wo8z0HXJS3BAq7leZa3LawXHcxT9IF6oK4sVUVI21UAorO9
	tUdbxlfRasX4WlRTEUT6w60lVxl6LI5/rQ0vyGT+g5DKXuHbjWXhL4h6
X-Gm-Gg: AfdE7cm7RhTyi82X6ymBr2UdtCblkeZpCuxzsqyHa++oNhBIAVfhuAEe38J0iXI3FCM
	OuMBX1Zj9HiaN/vhplu/aE79GdjEYlyYvYY2J/m+/19nakkF54+kptdTv8MpI0MN7cOZZlwcu83
	pdYqseTeDMB0snv4KLT1qXosqCN4mM3/J7tMibC9x/JSH3jnfvYCQJBSOC/0QHQMKrP0OgKN6z+
	2tu5LdSiPEHcjt7cYnCLvoCWsA34Ji7vaV04mBpypHb50xo11/ekU1HQ6Psf8hX4B1oHxcEHbjb
	wtUmTZW1bBci/0voHJUUyMgR4QFe3IPb0WULlQcvwdDD52jl1kVyGkJh9L1xh1BIRvXFh8T4/Ng
	7m4tO4RSzABW3ttfjl47HUBMqxmQXJ4HDwrWWhvshsBBQJzpveZOpXU2rnoZmLj6vQSstlcE3qi
	Uhxw+m/c9Ovu53oq2+LqYOsPmtWpa/tPdeMXHFwfuBWtGO9mawPQ19DdpydQ==
X-Received: by 2002:a05:7300:6420:b0:304:bd90:b88f with SMTP id 5a478bee46e88-30bcf5ff5abmr1293252eec.9.1781692737916;
        Wed, 17 Jun 2026 03:38:57 -0700 (PDT)
Received: from phuc-desktop.. ([183.91.15.56])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0828sm24616275eec.10.2026.06.17.03.38.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Jun 2026 03:38:57 -0700 (PDT)
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
Subject: [PATCH 38/78] ASoC: codecs: pcm512x: Use guard() for mutex locks
Date: Wed, 17 Jun 2026 17:31:55 +0700
Message-ID: <20260617103235.449609-39-phucduc.bui@gmail.com>
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
 sound/soc/codecs/pcm512x.c | 17 +++++------------
 1 file changed, 5 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/pcm512x.c b/sound/soc/codecs/pcm512x.c
index fdef98ce52f1..f4206f49f5b6 100644
--- a/sound/soc/codecs/pcm512x.c
+++ b/sound/soc/codecs/pcm512x.c
@@ -399,10 +399,9 @@ static int pcm512x_digital_playback_switch_get(struct snd_kcontrol *kcontrol,
 	struct snd_soc_component *component = snd_kcontrol_chip(kcontrol);
 	struct pcm512x_priv *pcm512x = snd_soc_component_get_drvdata(component);
 
-	mutex_lock(&pcm512x->mutex);
+	guard(mutex)(&pcm512x->mutex);
 	ucontrol->value.integer.value[0] = !(pcm512x->mute & 0x4);
 	ucontrol->value.integer.value[1] = !(pcm512x->mute & 0x2);
-	mutex_unlock(&pcm512x->mutex);
 
 	return 0;
 }
@@ -414,7 +413,7 @@ static int pcm512x_digital_playback_switch_put(struct snd_kcontrol *kcontrol,
 	struct pcm512x_priv *pcm512x = snd_soc_component_get_drvdata(component);
 	int ret, changed = 0;
 
-	mutex_lock(&pcm512x->mutex);
+	guard(mutex)(&pcm512x->mutex);
 
 	if ((pcm512x->mute & 0x4) == (ucontrol->value.integer.value[0] << 2)) {
 		pcm512x->mute ^= 0x4;
@@ -430,13 +429,10 @@ static int pcm512x_digital_playback_switch_put(struct snd_kcontrol *kcontrol,
 		if (ret != 0) {
 			dev_err(component->dev,
 				"Failed to update digital mute: %d\n", ret);
-			mutex_unlock(&pcm512x->mutex);
 			return ret;
 		}
 	}
 
-	mutex_unlock(&pcm512x->mutex);
-
 	return changed;
 }
 
@@ -1465,7 +1461,7 @@ static int pcm512x_mute(struct snd_soc_dai *dai, int mute, int direction)
 	int ret;
 	unsigned int mute_det;
 
-	mutex_lock(&pcm512x->mutex);
+	guard(mutex)(&pcm512x->mutex);
 
 	if (mute) {
 		pcm512x->mute |= 0x1;
@@ -1475,7 +1471,7 @@ static int pcm512x_mute(struct snd_soc_dai *dai, int mute, int direction)
 		if (ret != 0) {
 			dev_err(component->dev,
 				"Failed to set digital mute: %d\n", ret);
-			goto unlock;
+			return ret;
 		}
 
 		regmap_read_poll_timeout(pcm512x->regmap,
@@ -1488,7 +1484,7 @@ static int pcm512x_mute(struct snd_soc_dai *dai, int mute, int direction)
 		if (ret != 0) {
 			dev_err(component->dev,
 				"Failed to update digital mute: %d\n", ret);
-			goto unlock;
+			return ret;
 		}
 
 		regmap_read_poll_timeout(pcm512x->regmap,
@@ -1499,9 +1495,6 @@ static int pcm512x_mute(struct snd_soc_dai *dai, int mute, int direction)
 					 200, 10000);
 	}
 
-unlock:
-	mutex_unlock(&pcm512x->mutex);
-
 	return ret;
 }
 
-- 
2.43.0

