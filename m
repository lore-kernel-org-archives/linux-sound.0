Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirrus.com header.i=@cirrus.com header.b="MF+j0qgj"
Received: from mx0b-001ae601.pphosted.com (mx0b-001ae601.pphosted.com [67.231.152.168])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EA214116
	for <linux-sound@vger.kernel.org>; Mon, 11 Dec 2023 08:00:34 -0800 (PST)
Received: from pps.filterd (m0077474.ppops.net [127.0.0.1])
	by mx0b-001ae601.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 3BB7Pkm9007446;
	Mon, 11 Dec 2023 10:00:22 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirrus.com; h=
	from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding:content-type; s=
	PODMain02222019; bh=Z8mNQxvtfK0GIc60KNPQ4AiJ4cdO+EP4xZTuiTrV6u4=; b=
	MF+j0qgjm++zHTpQDTDZhW4mNFQemwIg2rwY6z53j90n5zStHj7xI1xMWiSWIETX
	jKL4U/0q3Q7m9X1LlBb6QiHXSp8AIyU843iQFH9nQOwjdCA6hhuop5yGusL9ewgU
	H5/Ef80Ucr0gmTHoFtdIgj4z0/B9Fyjww6cwHpDyWH9SnLxVEUejT1/wF9TUTQjY
	2b8JWDHkGprYHMMCQhs2sRouY6B0PFVzUHhT62qXy1aJsKxlw4MyxDMqxWrsTH49
	rXg0TF09NX5xG5RiojnpjJ5ubXnOTTwSEq4WXGfptlczsIiBCTKmQmwjjkJEBPae
	ZHUF7ooXqEm05trOpAlZPQ==
Received: from ediex01.ad.cirrus.com ([84.19.233.68])
	by mx0b-001ae601.pphosted.com (PPS) with ESMTPS id 3uvnhpj0qy-2
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 11 Dec 2023 10:00:21 -0600 (CST)
Received: from ediex02.ad.cirrus.com (198.61.84.81) by ediex01.ad.cirrus.com
 (198.61.84.80) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Mon, 11 Dec
 2023 16:00:19 +0000
Received: from ediswmail.ad.cirrus.com (198.61.86.93) by
 anon-ediex02.ad.cirrus.com (198.61.84.81) with Microsoft SMTP Server id
 15.2.1118.40 via Frontend Transport; Mon, 11 Dec 2023 16:00:19 +0000
Received: from algalon.ad.cirrus.com (algalon.ad.cirrus.com [198.90.251.122])
	by ediswmail.ad.cirrus.com (Postfix) with ESMTP id 56CB611D4;
	Mon, 11 Dec 2023 16:00:19 +0000 (UTC)
From: Charles Keepax <ckeepax@opensource.cirrus.com>
To: <broonie@kernel.org>
CC: <lgirdwood@gmail.com>, <linux-sound@vger.kernel.org>,
        <alsa-devel@alsa-project.org>, <patches@opensource.cirrus.com>
Subject: [PATCH 2/2] ASoC: cs42l43: Allow HP amp to cool off after current limit
Date: Mon, 11 Dec 2023 16:00:19 +0000
Message-ID: <20231211160019.2034442-2-ckeepax@opensource.cirrus.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231211160019.2034442-1-ckeepax@opensource.cirrus.com>
References: <20231211160019.2034442-1-ckeepax@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Proofpoint-GUID: ju_ol_jfxBlnFMei0z9vswXDhy5Ap4jJ
X-Proofpoint-ORIG-GUID: ju_ol_jfxBlnFMei0z9vswXDhy5Ap4jJ
X-Proofpoint-Spam-Reason: safe

Whilst occasional current limiting is fine, constant current limiting
should be avoided. Add a back off system that will disable the
headphone amp, if a lot of current limiting is seen in a short window
of time.

Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/cs42l43-jack.c |  4 +-
 sound/soc/codecs/cs42l43.c      | 88 +++++++++++++++++++++++++++++++--
 sound/soc/codecs/cs42l43.h      |  9 ++++
 3 files changed, 96 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/cs42l43-jack.c b/sound/soc/codecs/cs42l43-jack.c
index 54a3ea6064438..24a598f2ed9a3 100644
--- a/sound/soc/codecs/cs42l43-jack.c
+++ b/sound/soc/codecs/cs42l43-jack.c
@@ -507,7 +507,7 @@ static void cs42l43_start_load_detect(struct cs42l43_codec *priv)
 
 	priv->load_detect_running = true;
 
-	if (priv->hp_ena) {
+	if (priv->hp_ena && !priv->hp_ilimited) {
 		unsigned long time_left;
 
 		reinit_completion(&priv->hp_shutdown);
@@ -572,7 +572,7 @@ static void cs42l43_stop_load_detect(struct cs42l43_codec *priv)
 			   CS42L43_ADC1_EN_MASK | CS42L43_ADC2_EN_MASK,
 			   priv->adc_ena);
 
-	if (priv->hp_ena) {
+	if (priv->hp_ena && !priv->hp_ilimited) {
 		unsigned long time_left;
 
 		reinit_completion(&priv->hp_startup);
diff --git a/sound/soc/codecs/cs42l43.c b/sound/soc/codecs/cs42l43.c
index 5c98343ebf71b..d2412dab35996 100644
--- a/sound/soc/codecs/cs42l43.c
+++ b/sound/soc/codecs/cs42l43.c
@@ -138,7 +138,87 @@ CS42L43_IRQ_ERROR(spkr_therm_warm)
 CS42L43_IRQ_ERROR(spkl_therm_warm)
 CS42L43_IRQ_ERROR(spkr_sc_detect)
 CS42L43_IRQ_ERROR(spkl_sc_detect)
-CS42L43_IRQ_ERROR(hp_ilimit)
+
+void cs42l43_hp_ilimit_clear_work(struct work_struct *work)
+{
+	struct cs42l43_codec *priv = container_of(work, struct cs42l43_codec,
+						  hp_ilimit_clear_work.work);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(priv->component);
+
+	snd_soc_dapm_mutex_lock(dapm);
+
+	priv->hp_ilimit_count--;
+
+	if (priv->hp_ilimit_count)
+		queue_delayed_work(system_wq, &priv->hp_ilimit_clear_work,
+				   msecs_to_jiffies(CS42L43_HP_ILIMIT_DECAY_MS));
+
+	snd_soc_dapm_mutex_unlock(dapm);
+}
+
+void cs42l43_hp_ilimit_work(struct work_struct *work)
+{
+	struct cs42l43_codec *priv = container_of(work, struct cs42l43_codec,
+						  hp_ilimit_work);
+	struct snd_soc_dapm_context *dapm = snd_soc_component_get_dapm(priv->component);
+	struct cs42l43 *cs42l43 = priv->core;
+
+	snd_soc_dapm_mutex_lock(dapm);
+
+	if (priv->hp_ilimit_count < CS42L43_HP_ILIMIT_MAX_COUNT) {
+		if (!priv->hp_ilimit_count)
+			queue_delayed_work(system_wq, &priv->hp_ilimit_clear_work,
+					   msecs_to_jiffies(CS42L43_HP_ILIMIT_DECAY_MS));
+
+		priv->hp_ilimit_count++;
+		snd_soc_dapm_mutex_unlock(dapm);
+		return;
+	}
+
+	dev_err(priv->dev, "Disabling headphone for %dmS, due to frequent current limit\n",
+		CS42L43_HP_ILIMIT_BACKOFF_MS);
+
+	priv->hp_ilimited = true;
+
+	// No need to wait for disable, as just disabling for a period of time
+	regmap_update_bits(cs42l43->regmap, CS42L43_BLOCK_EN8,
+			   CS42L43_HP_EN_MASK, 0);
+
+	snd_soc_dapm_mutex_unlock(dapm);
+
+	msleep(CS42L43_HP_ILIMIT_BACKOFF_MS);
+
+	snd_soc_dapm_mutex_lock(dapm);
+
+	if (priv->hp_ena && !priv->load_detect_running) {
+		unsigned long time_left;
+
+		reinit_completion(&priv->hp_startup);
+
+		regmap_update_bits(cs42l43->regmap, CS42L43_BLOCK_EN8,
+				   CS42L43_HP_EN_MASK, priv->hp_ena);
+
+		time_left = wait_for_completion_timeout(&priv->hp_startup,
+							msecs_to_jiffies(CS42L43_HP_TIMEOUT_MS));
+		if (!time_left)
+			dev_err(priv->dev, "ilimit HP restore timed out\n");
+	}
+
+	priv->hp_ilimited = false;
+
+	snd_soc_dapm_mutex_unlock(dapm);
+}
+
+static irqreturn_t cs42l43_hp_ilimit(int irq, void *data)
+{
+	struct cs42l43_codec *priv = data;
+
+	dev_dbg(priv->dev, "headphone ilimit IRQ\n");
+
+	queue_work(system_long_wq, &priv->hp_ilimit_work);
+
+	return IRQ_HANDLED;
+}
 
 #define CS42L43_IRQ_COMPLETE(name) \
 static irqreturn_t cs42l43_##name(int irq, void *data) \
@@ -1452,13 +1532,13 @@ static int cs42l43_hp_ev(struct snd_soc_dapm_widget *w,
 		if (ret)
 			return ret;
 
-		if (!priv->load_detect_running)
+		if (!priv->load_detect_running && !priv->hp_ilimited)
 			regmap_update_bits(cs42l43->regmap, CS42L43_BLOCK_EN8,
 					   mask, val);
 		break;
 	case SND_SOC_DAPM_POST_PMU:
 	case SND_SOC_DAPM_POST_PMD:
-		if (priv->load_detect_running)
+		if (priv->load_detect_running || priv->hp_ilimited)
 			break;
 
 		ret = cs42l43_dapm_wait_completion(&priv->hp_startup,
@@ -2169,7 +2249,9 @@ static int cs42l43_codec_probe(struct platform_device *pdev)
 	INIT_DELAYED_WORK(&priv->tip_sense_work, cs42l43_tip_sense_work);
 	INIT_DELAYED_WORK(&priv->bias_sense_timeout, cs42l43_bias_sense_timeout);
 	INIT_DELAYED_WORK(&priv->button_press_work, cs42l43_button_press_work);
+	INIT_DELAYED_WORK(&priv->hp_ilimit_clear_work, cs42l43_hp_ilimit_clear_work);
 	INIT_WORK(&priv->button_release_work, cs42l43_button_release_work);
+	INIT_WORK(&priv->hp_ilimit_work, cs42l43_hp_ilimit_work);
 
 	pm_runtime_set_autosuspend_delay(priv->dev, 100);
 	pm_runtime_use_autosuspend(priv->dev);
diff --git a/sound/soc/codecs/cs42l43.h b/sound/soc/codecs/cs42l43.h
index bf4f728eea3e0..125e36861d5d5 100644
--- a/sound/soc/codecs/cs42l43.h
+++ b/sound/soc/codecs/cs42l43.h
@@ -28,6 +28,10 @@
 #define CS42L43_HP_TIMEOUT_MS		2000
 #define CS42L43_LOAD_TIMEOUT_MS		1000
 
+#define CS42L43_HP_ILIMIT_BACKOFF_MS	1000
+#define CS42L43_HP_ILIMIT_DECAY_MS	300
+#define CS42L43_HP_ILIMIT_MAX_COUNT	4
+
 #define CS42L43_ASP_MAX_CHANNELS	6
 #define CS42L43_N_EQ_COEFFS		15
 
@@ -88,6 +92,11 @@ struct cs42l43_codec {
 	bool button_detect_running;
 	bool jack_present;
 	int jack_override;
+
+	struct work_struct hp_ilimit_work;
+	struct delayed_work hp_ilimit_clear_work;
+	bool hp_ilimited;
+	int hp_ilimit_count;
 };
 
 #if IS_REACHABLE(CONFIG_SND_SOC_CS42L43_SDW)
-- 
2.39.2

