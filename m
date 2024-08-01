Received: from mx0b-001ae601.pphosted.com (mx0a-001ae601.pphosted.com [67.231.149.25])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 946BC170A30
	for <linux-sound@vger.kernel.org>; Thu,  1 Aug 2024 10:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.149.25
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722506682; cv=none; b=FRkf2dnIcpVA6KAo4GtqYw9mmJ4vmpKCrtPTie3FIYb/r+QI2x1z5seX8iYiOdw2AJ8L5SCUswwirH9v6601MI3aXG5/3ZP685ORrB3A52KDTQ7bVrRCqyZo5o30UmjVVeT0clajKVJ2WITYhf0sr1NZ6kaYLMFtvJ7QrpbOxkA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722506682; c=relaxed/simple;
	bh=zoU4Lf/PPsA3GMUOCsjDCfy1D2Vo8A6EE5i6DhW0Umw=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=kQinSu/GjDhVCsmody1nOO5b0Pj1+MbDdhZvNwMnBdyFEOD8gWKwf7HLhKvKPxyYaLhk6NlFhunHXJW1sGdjEr8WLIG7M6GwMEJ3IcCGo997vw9EQqU8uhxofPn6sKsjQ05IU0Onqwgz567a8BD0Ok3MQuaHZ2K9E0weG1TdwqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=DwYZG3SF; arc=none smtp.client-ip=67.231.149.25
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="DwYZG3SF"
Received: from pps.filterd (m0077473.ppops.net [127.0.0.1])
	by mx0a-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4714lo5f015269;
	Thu, 1 Aug 2024 05:04:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	PODMain02222019; bh=H8QFG9IYG4iiEx7cqm33uX87JIeQVPmanSrzUVpH6Ok=; b=
	DwYZG3SFyPE7nyYME1uSAPOViEfFFGkBOia0Boi4mHNXi5iMphcSP2YLJGOcLouc
	jb1nqdXzDvnfqHB4NCB7ZBhIjFaC84mZugrryh0EqZaac49cl2lxUYW4mJ7wlfdZ
	tf62QWlCBkFHDP0gktTRte916cLsBDmJKRFDxRSv7hwk/WeBxYd0iq5ByfLaL9Ot
	vlvCMqyHAAy30p1mpLsMAuhGod3kQNS7nbCZVn6Fd2amlThVraYXaORJTqum+xzm
	EGWYaaVdL1sZZVY8y7J/UR7ezpsTToZW5Ir6fzTCWqD1aPZgG8pvyNcrw82mgEgI
	Zxy2ifhqGkwR+N5Mc6B4bQ==
Received: from ediex02.ad.cirrus.com ([84.19.233.68])
	by mx0a-001ae601.pphosted.com (PPS) with ESMTPS id 40mx9ypeqe-3
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 01 Aug 2024 05:04:17 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex02.ad.cirrus.com
 (198.61.84.81) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 1 Aug 2024
 11:04:13 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Thu, 1 Aug 2024 11:04:13 +0100
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 4F46F820258;
	Thu,  1 Aug 2024 10:04:13 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>, <perex@perex.cz>, <tiwai@suse.com>
CC: <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH v3 4/4] ASoC: cs42l43: Cache shutter IRQ control pointers
Date: Thu, 1 Aug 2024 11:04:13 +0100
Message-ID: <20240801100413.1620481-4-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240801100413.1620481-1-ckeepax@opensource.cirrus.com>
References: <20240801100413.1620481-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: lBHIxIH0HfMPNMqPsZHi0S4q9bOgBQIe
X-Proofpoint-ORIG-GUID: lBHIxIH0HfMPNMqPsZHi0S4q9bOgBQIe
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

Changes since v2:
 - Added DAI probe/remove for ASP as well

Thanks,
Charles

 sound/soc/codecs/cs42l43.c | 73 +++++++++++++++++++++++++++++---------
 sound/soc/codecs/cs42l43.h |  2 ++
 2 files changed, 58 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index 80825777048a6..5183b45864243 100644
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
 
@@ -590,7 +588,46 @@ static int cs42l43_asp_set_tdm_slot(struct snd_soc_dai *dai, unsigned int tx_mas
 	return 0;
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
 static const struct snd_soc_dai_ops cs42l43_asp_ops = {
+	.probe		= cs42l43_dai_probe,
+	.remove		= cs42l43_dai_remove,
 	.startup	= cs42l43_startup,
 	.hw_params	= cs42l43_asp_hw_params,
 	.set_fmt	= cs42l43_asp_set_fmt,
@@ -611,6 +648,8 @@ static int cs42l43_sdw_hw_params(struct snd_pcm_substream *substream,
 }
 
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

