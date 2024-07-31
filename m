Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E7A1B150E
	for <linux-sound@vger.kernel.org>; Wed, 31 Jul 2024 13:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722433165; cv=none; b=TwUG4t/fezuIgSV6NWBsNPSPN64HfVaDfoq0iDfhB6xwDBT96/SO+mzy9LjgD5pls3Q3OaY5GwHdz//4lrgVwBRWrz/pG2aLbor2QX8GlQv62d21B9Jj6g6YXy8u1fzJzAJEkRWzteULP3rCQTBQTvW1fIZRo3t00nW64wxSmrc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722433165; c=relaxed/simple;
	bh=ifq4h83TLy8JXilG/hl+jWn6ga0DPqrZ8TNoSU2S0+0=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LUEM/EWftQVJ0dMeGl4D8RAXatmAImjmiSb01nxVuq8k5+Yf1FpFOgRG1GgtBNQfSL7/k4InC66m3iZZYWlmf0cnBFnLptNfFzQN4XKO8RHwERVVxfuur1QYqTbT21+gkOHtNxW5wmi9DTDqtDWYsZ2gtVHOWG04EgKtqf3QVnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=kBGAG7wl; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="kBGAG7wl"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46V4lq22024935;
	Wed, 31 Jul 2024 08:39:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=cpiXLtlfye2O3//8/H7Ej9nzI0d79T4gUqLx5iJk4z8=; b=
	kBGAG7wlR0cqX7A0H1MEcRkjeKdO5v+ow8sWOyO66m6D8UojhhX8j0Amb3seWi72
	DTmTygVZ5pc/cNfKZ+sDJHcZteVqbDFPLBG8t1QLEdQXE0YkRRL4eZ9l5vtkWVqf
	7n4qgvy8vsqXlQBeSHRCpuxZaCG3GK7zw/SQk2qtsLor90nm/5SDpkMp1vSzKuAI
	14AFDoybhCV0iaFtNGxrrqqu9xIWngOvfJrosl+eyanANrzf0Shn/Jf1/9J/Oeve
	+TyG3HVIQZ4uwexpqZWFaRVBh4ha5GMe++PulFbcVAYbBZcS4GF+ADQ99c1Yiw1y
	XNLkpSW5ZnQm7BjfWM/Zaw==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 40mx9ymr5u-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 31 Jul 2024 08:39:09 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 31 Jul
 2024 14:39:05 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Wed, 31 Jul 2024 14:39:05 +0100
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 49AEF820258;
	Wed, 31 Jul 2024 13:39:05 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>
CC: <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH v2 4/4] ASoC: cs42l43: Cache shutter IRQ control pointers
Date: Wed, 31 Jul 2024 14:39:05 +0100
Message-ID: <20240731133905.1254796-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240731133905.1254796-1-ckeepax@opensource.cirrus.com>
References: <20240731133905.1254796-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: PSnaTqj-8-NyEOoxcx1o6FI1T5imnr3Q
X-Proofpoint-ORIG-GUID: PSnaTqj-8-NyEOoxcx1o6FI1T5imnr3Q
X-Proofpoint-Spam-Reason: safe

The microphone/speaker privacy shutter ALSA control handlers need to
call pm_runtime_resume, since the hardware needs to be powered up to
check the hardware state of the shutter. The IRQ handler for the
shutters also needs to notify the ALSA control to inform user-space
the shutters updated. However this leads to a mutex inversion,
between the sdw_dev_lock and the controls_rwsem.

To avoid this mutex inversion cache the kctl pointers before the IRQ
handler, which avoids the need to lookup the control and take the
controls_rwsem.

Suggested-by: Jaroslav Kysela <perex@perex.cz>
Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---

Changes since v1:
 - Rather than delaying to a work queue, cache the control pointers to
   avoid looking them up in the IRQ handler.

 sound/soc/codecs/cs42l43.c | 71 +++++++++++++++++++++++++++++---------
 sound/soc/codecs/cs42l43.h |  2 ++
 2 files changed, 56 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index 80825777048a6..4771f235b1cc4 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -7,6 +7,7 @@
 
 #include <linux/bitops.h>
 #include <linux/bits.h>
+#include <linux/build_bug.h>
 #include <linux/clk.h>
 #include <linux/device.h>
 #include <linux/err.h>
@@ -252,24 +253,20 @@ CS42L43_IRQ_COMPLETE(load_detect)
 static irqreturn_t cs42l43_mic_shutter(int irq, void *data)
 {
 	struct cs42l43_codec *priv = data;
-	static const char * const controls[] = {
-		"Decimator 1 Switch",
-		"Decimator 2 Switch",
-		"Decimator 3 Switch",
-		"Decimator 4 Switch",
-	};
-	int i, ret;
+	struct snd_soc_component *component = priv->component;
+	int i;
 
 	dev_dbg(priv->dev, "Microphone shutter changed\n");
 
-	if (!priv->component)
+	if (!component)
 		return IRQ_NONE;
 
-	for (i = 0; i < ARRAY_SIZE(controls); i++) {
-		ret = snd_soc_component_notify_control(priv->component,
-						       controls[i]);
-		if (ret)
+	for (i = 1; i < ARRAY_SIZE(priv->kctl); i++) {
+		if (!priv->kctl[i])
 			return IRQ_NONE;
+
+		snd_ctl_notify(component->card->snd_card,
+			       SNDRV_CTL_EVENT_MASK_VALUE, &priv->kctl[i]->id);
 	}
 
 	return IRQ_HANDLED;
@@ -278,18 +275,19 @@ static irqreturn_t cs42l43_mic_shutter(int irq, void *data)
 static irqreturn_t cs42l43_spk_shutter(int irq, void *data)
 {
 	struct cs42l43_codec *priv = data;
-	int ret;
+	struct snd_soc_component *component = priv->component;
 
 	dev_dbg(priv->dev, "Speaker shutter changed\n");
 
-	if (!priv->component)
+	if (!component)
 		return IRQ_NONE;
 
-	ret = snd_soc_component_notify_control(priv->component,
-					       "Speaker Digital Switch");
-	if (ret)
+	if (!priv->kctl[0])
 		return IRQ_NONE;
 
+	snd_ctl_notify(component->card->snd_card,
+		       SNDRV_CTL_EVENT_MASK_VALUE, &priv->kctl[0]->id);
+
 	return IRQ_HANDLED;
 }
 
@@ -610,7 +608,46 @@ static int cs42l43_sdw_hw_params(struct snd_pcm_substream *substream,
 	return cs42l43_set_sample_rate(substream, params, dai);
 }
 
+static int cs42l43_dai_probe(struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct cs42l43_codec *priv = snd_soc_component_get_drvdata(component);
+	static const char * const controls[] = {
+		"Speaker Digital Switch",
+		"Decimator 1 Switch",
+		"Decimator 2 Switch",
+		"Decimator 3 Switch",
+		"Decimator 4 Switch",
+	};
+	int i;
+
+	static_assert(ARRAY_SIZE(controls) == ARRAY_SIZE(priv->kctl));
+
+	for (i = 0; i < ARRAY_SIZE(controls); i++) {
+		if (priv->kctl[i])
+			continue;
+
+		priv->kctl[i] = snd_soc_component_get_kcontrol(component, controls[i]);
+	}
+
+	return 0;
+}
+
+static int cs42l43_dai_remove(struct snd_soc_dai *dai)
+{
+	struct snd_soc_component *component = dai->component;
+	struct cs42l43_codec *priv = snd_soc_component_get_drvdata(component);
+	int i;
+
+	for (i = 0; i < ARRAY_SIZE(priv->kctl); i++)
+		priv->kctl[i] = NULL;
+
+	return 0;
+}
+
 static const struct snd_soc_dai_ops cs42l43_sdw_ops = {
+	.probe		= cs42l43_dai_probe,
+	.remove		= cs42l43_dai_remove,
 	.startup	= cs42l43_startup,
 	.set_stream	= cs42l43_sdw_set_stream,
 	.hw_params	= cs42l43_sdw_hw_params,
diff --git a/sound/soc/codecs/cs42l43.h b/sound/soc/codecs/cs42l43.h
index 9924c13e1eb53..9c144e129535f 100644
--- a/sound/soc/codecs/cs42l43.h
+++ b/sound/soc/codecs/cs42l43.h
@@ -100,6 +100,8 @@ struct cs42l43_codec {
 	struct delayed_work hp_ilimit_clear_work;
 	bool hp_ilimited;
 	int hp_ilimit_count;
+
+	struct snd_kcontrol *kctl[5];
 };
 
 #if IS_REACHABLE(CONFIG_SND_SOC_CS42L43_SDW)
-- 
2.39.2

