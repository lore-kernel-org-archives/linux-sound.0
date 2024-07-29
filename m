Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B554E15ECCD
	for <linux-sound@vger.kernel.org>; Mon, 29 Jul 2024 16:00:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.152.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722268804; cv=none; b=kTkYtK9jBQHv75coy0Tb+2NrA48PjhGfSVCkbSsVapf7o/DUVkVwfbh3oAa1DJ8bxTEM43L2zkLRIksLDEHfVNwJAWMTjcv8DJHAJU2Ha7K8GlW7wZ4YGEFQMnjmdx42naTxf8pAFKwbu9IrNXt55Ws9CUSf7y22RTJjNRktlqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722268804; c=relaxed/simple;
	bh=kVGumY+mAZG5RJ2rB9bJ9hs91h7rV2CoiJf6JomecSc=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=hSlX4FxUYDt+ElThPdDPWeegksosbwdL/0qDWo8qzUBKm7qakE+OfXOtiJfsSSAtL6PWF8GnxzHVCGJD+pTkPZ5U/JYcKBSpb5Rgf7G2PVdErgqIQJZ6POSxhyJbS1eypRoRThyo13+JBLs0/Thl31BH90XA68nK8yXQFkTpb5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com; spf=pass smtp.mailfrom=opensource.cirrus.com; dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b=moc7I839; arc=none smtp.client-ip=67.231.152.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=opensource.cirrus.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="moc7I839"
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 46TFFclr019068;
	Mon, 29 Jul 2024 10:59:48 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=PODMain02222019; bh=FmaK8QFsz3Ior7ed
	m84cd4V3HgESwt18+R2cm+aULMQ=; b=moc7I839phJr2mP1Q4iL+ZR7AWLlu39h
	Nomg8by6Lp/ugB9hOoGqfdxOpLt3K1NtOxsYHvqYFsq496CGc7zzAFyZfRPtPaco
	HqGC3a+X7ppCHW08u/HMWSlzbuzs/T1PzuhgCZu6ebUFmk1DWh33xyvG6uJV5Nra
	037OEyJw/3d5Bxr12dXLKDKnhWqkH+CME9BObczipviLGTOnH6SG+WDaF9fbuwzV
	uOanSLDpD270BMRs8H0RIXur/Ytdo1dBFm/QLfIKsgCdzlN53OZ2lYPQat/y+bTN
	91Ih4wz8FBh/H37He/4XtXQTqwwEkTSbzYnTge3h5OIVPXXHZJh8Fw==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 40mwajtaqm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 29 Jul 2024 10:59:47 -0500 (CDT)
Received: from ediex01.ad.cirrus.com (198.61.84.80) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 29 Jul
 2024 16:59:32 +0100
Received: from ediswmail9.ad.cirrus.com (198.61.86.93) by
 anon-ediex01.ad.cirrus.com (198.61.84.80) with Microsoft SMTP Server id
 15.2.1544.9 via Frontend Transport; Mon, 29 Jul 2024 16:59:32 +0100
Received: from ediswws07.ad.cirrus.com (ediswws07.ad.cirrus.com [198.90.208.14])
	by ediswmail9.ad.cirrus.com (Postfix) with ESMTP id 68C58820244;
	Mon, 29 Jul 2024 15:59:32 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <patches@opensource.cirrus.com>
Subject: [PATCH] ASoC: cs42l43: Move shutter IRQ handling into a worker thread
Date: Mon, 29 Jul 2024 16:59:32 +0100
Message-ID: <20240729155932.3054632-1-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: n9SVWVfiNtVVZwIg2VYpMmLLNJf7tvQI
X-Proofpoint-ORIG-GUID: n9SVWVfiNtVVZwIg2VYpMmLLNJf7tvQI
X-Proofpoint-Spam-Reason: safe

The microphone/speaker privacy shutter ALSA control handlers need to
call pm_runtime_resume, since the hardware needs to be powered up to
check the hardware state of the shutter. The IRQ handler for the
shutters also needs to notify the ALSA control to inform user-space
the shutters updated. However this leads to a mutex inversion, between
the sdw_dev_lock and the controls_rwsem.

To avoid this mutex inversion add a work item for handling the shutter
IRQ and move the notifies into that.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l43.c | 43 +++++++++++++++++++++++++++-----------
 sound/soc/codecs/cs42l43.h |  3 +++
 2 files changed, 34 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index 92674314227c4..74cb396ec0576 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -249,9 +249,10 @@ CS42L43_IRQ_COMPLETE(spkr_startup)
 CS42L43_IRQ_COMPLETE(spkl_startup)
 CS42L43_IRQ_COMPLETE(load_detect)
 
-static irqreturn_t cs42l43_mic_shutter(int irq, void *data)
+static void cs42l43_mic_shutter_work(struct work_struct *work)
 {
-	struct cs42l43_codec *priv = data;
+	struct cs42l43_codec *priv = container_of(work, struct cs42l43_codec,
+						  mic_shutter_work);
 	static const char * const controls[] = {
 		"Decimator 1 Switch",
 		"Decimator 2 Switch",
@@ -263,32 +264,47 @@ static irqreturn_t cs42l43_mic_shutter(int irq, void *data)
 	dev_dbg(priv->dev, "Microphone shutter changed\n");
 
 	if (!priv->component)
-		return IRQ_NONE;
+		return;
 
 	for (i = 0; i < ARRAY_SIZE(controls); i++) {
-		ret = snd_soc_component_notify_control(priv->component,
-						       controls[i]);
+		ret = snd_soc_component_notify_control(priv->component, controls[i]);
 		if (ret)
-			return IRQ_NONE;
+			dev_err(priv->dev, "Failed to notify control %s: %d\n",
+				controls[i], ret);
 	}
+}
+
+static irqreturn_t cs42l43_mic_shutter(int irq, void *data)
+{
+	struct cs42l43_codec *priv = data;
+
+	queue_work(system_wq, &priv->mic_shutter_work);
 
 	return IRQ_HANDLED;
 }
 
-static irqreturn_t cs42l43_spk_shutter(int irq, void *data)
+static void cs42l43_spk_shutter_work(struct work_struct *work)
 {
-	struct cs42l43_codec *priv = data;
+	struct cs42l43_codec *priv = container_of(work, struct cs42l43_codec,
+						  mic_shutter_work);
+	const char * const control = "Speaker Digital Switch";
 	int ret;
 
 	dev_dbg(priv->dev, "Speaker shutter changed\n");
 
 	if (!priv->component)
-		return IRQ_NONE;
+		return;
 
-	ret = snd_soc_component_notify_control(priv->component,
-					       "Speaker Digital Switch");
+	ret = snd_soc_component_notify_control(priv->component, control);
 	if (ret)
-		return IRQ_NONE;
+		dev_err(priv->dev, "Failed to notify control %s: %d\n", control, ret);
+}
+
+static irqreturn_t cs42l43_spk_shutter(int irq, void *data)
+{
+	struct cs42l43_codec *priv = data;
+
+	queue_work(system_wq, &priv->spk_shutter_work);
 
 	return IRQ_HANDLED;
 }
@@ -2280,6 +2296,9 @@ static int cs42l43_codec_probe(struct platform_device *pdev)
 	INIT_WORK(&priv->button_release_work, cs42l43_button_release_work);
 	INIT_WORK(&priv->hp_ilimit_work, cs42l43_hp_ilimit_work);
 
+	INIT_WORK(&priv->mic_shutter_work, cs42l43_mic_shutter_work);
+	INIT_WORK(&priv->spk_shutter_work, cs42l43_spk_shutter_work);
+
 	pm_runtime_set_autosuspend_delay(priv->dev, 100);
 	pm_runtime_use_autosuspend(priv->dev);
 	pm_runtime_set_active(priv->dev);
diff --git a/sound/soc/codecs/cs42l43.h b/sound/soc/codecs/cs42l43.h
index 9924c13e1eb53..5592aab5c8042 100644
--- a/sound/soc/codecs/cs42l43.h
+++ b/sound/soc/codecs/cs42l43.h
@@ -100,6 +100,9 @@ struct cs42l43_codec {
 	struct delayed_work hp_ilimit_clear_work;
 	bool hp_ilimited;
 	int hp_ilimit_count;
+
+	struct work_struct mic_shutter_work;
+	struct work_struct spk_shutter_work;
 };
 
 #if IS_REACHABLE(CONFIG_SND_SOC_CS42L43_SDW)
-- 
2.39.2

