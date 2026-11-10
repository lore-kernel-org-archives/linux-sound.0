Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=160.236.53.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794297949;
	b=Oh322gvMi6pvUEmTsyXPvocnXpUswBBlULcXd7TiZ7GFK6qX9ZKzvlz9I1d9zFg0/Jq2
	 UWvN6wvK53FtzJtcYq21l/4ggKfp1XhMJVRyqF+64LzYDDUlZ486b6Jk0oY5UwDjUpxS0
	 FolgOmYXNm6G/7eRml2B5lUAJ2USmZvoKaehmZEDJf+rF0tToXTucF4y9K2pVj7+Hbkih
	 tLvz9BRgSbK0gRx3jlcRDzdc68kDa0mWAhk/pqIBvj5DfZQMsEejshd+zAm9+Tp0xHxhx
	 FUnCLrLK6rGmcUBwYJpTTf12l2o5NrlhE84sG5+FldXdtg0fijrT9HeCz45hA33DeZA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794297949;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=KDdQRXTfMaabor4sH47o/OHItLisHcI6oVjxC5aTes0=;
	b=qe0WxXADf37QFvs6fDrv46jEB4VFzlBNeIcQTM8AwL0pkhp6fClhCWCpBm0TZN7axpra
	 0Qv8nU5xtPPwAYX741zp943uj5tC5PHWisnqnqjGB0Qtcpv2oJNg4dcAWJsNjA7Bb+m0u
	 GLBhPUbmy5Pmus2hUGXM+wbGlyhFbE3IkhCdx0ojwoM80TDC2f8PPPVeDKRswkVNXwAL1
	 IuPilS7P5HQnXwrP+SGsz1acWe70Ta6svMv5tkyhcdAWs9zZ9BWkDJn4/BpB0PZDsFhaq
	 bmbKb/cAuQu2KzF8/vNBG3MwuOFx/ddXr2nl688dzuDbx42dOLbX+zXKtLv7pbTD7Og==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=senarytech.com;
	spf=pass smtp.mailfrom=senarytech.com;
	dkim=pass header.d=senarytech.com header.i=@senarytech.com header.a=rsa-sha256 header.s=default header.b=cMX+qc7x;
	arc=none smtp.remote-ip=160.236.53.10
Received: from mail-m1602365310.xmail.ntesmail.com (mail-m1602365310.xmail.ntesmail.com [160.236.53.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 912BE606A31C
	for <linux-sound@vger.kernel.org>; Tue, 10 Nov 2026 08:05:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 912BE606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=senarytech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=senarytech.com header.i=@senarytech.com header.a=rsa-sha256 header.s=default header.b=cMX+qc7x
Received: from Wangqianghua.localdomain (unknown [101.207.32.251])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54224b28f;
	Tue, 10 Nov 2026 16:05:35 +0800 (GMT+08:00)
From: Qianghua Wang <qianghua.wang@senarytech.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-sound@vger.kernel.org,
	Liam Girdwood <lgirdwood@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	bo liu <bo.liu@senarytech.com>,
	Qianghua Wang <qianghua.wang@senarytech.com>
Subject: [PATCH v2] ASoC: sdw_utils: senary: handle a missing name_prefix
Date: Tue, 10 Nov 2026 16:05:35 +0800
Message-ID: <20261110080535.870596-1-qianghua.wang@senarytech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261110073420.842175-1-qianghua.wang@senarytech.com>
References: <20261110073420.842175-1-qianghua.wang@senarytech.com>
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Post: <mailto:linux-sound@vger.kernel.org>
List-Help: <mailto:linux-sound+help@vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-sound+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1c47db59409d8kunm26f442cb336b3d
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDQhpCVh1OSx9MHxlOSB1CSFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlKS0pVSUtMVUhJVUlOSllXWRYaDxIVHRRZQVlPS0hVSk
	tJT09PSFVKS0tVSkJLS1kG
DKIM-Signature: a=rsa-sha256;
	b=cMX+qc7xGfH5XUCdWJ6NsNHAkJq+3f9UTvOBBkdU/0wsNyqxsHbaY/02zjnm6i3IJCNJ9Dg/dKQ1c8n54KmI4FCEqxHx3U96zS4pLQv+X8Efe2dyUAsh9sGLtVD2zLv6QMX6oosZUe9qD4lfq+fOyfhSAd7O+NwX6lA8Pe4t/F8=; s=default; c=relaxed/relaxed; d=senarytech.com; v=1;
	bh=KDdQRXTfMaabor4sH47o/OHItLisHcI6oVjxC5aTes0=;
	h=date:mime-version:subject:message-id:from;

asoc_sdw_senary_sdca_jack_rtd_init() passes component->name_prefix to
strstr(). When codec_conf does not apply the prefix, name_prefix is
NULL and card registration oopses.

DAPM widgets then keep the bare names from the codec driver (HP, MIC2,
SPK, DMIC). Keep the existing "sn624x ..." routes when name_prefix is
set, and connect those bare widgets when it is missing. card->components
still reports hs:sn624x-sdca and mic:sn624x-dmic.

Fixes: 77272ecd96d7 ("ASoC: sdw_utils: add Senary SN624x helpers and codec_info")
Signed-off-by: Qianghua Wang <qianghua.wang@senarytech.com>
---
Changes in v2:
- add a Fixes: tag for 77272ecd96d7, which introduced the unguarded
  strstr() on component->name_prefix


diff --git a/sound/soc/sdw_utils/soc_sdw_senary_dmic.c b/sound/soc/sdw_utils/soc_sdw_senary_dmic.c
index 748170656..725f4658e 100644
--- a/sound/soc/sdw_utils/soc_sdw_senary_dmic.c
+++ b/sound/soc/sdw_utils/soc_sdw_senary_dmic.c
@@ -15,6 +15,10 @@ static const struct snd_soc_dapm_route senary_dmic_map[] = {
 	{ "sn624x DMIC", NULL, "Dmic" },
 };
 
+static const struct snd_soc_dapm_route senary_dmic_map_bare[] = {
+	{ "DMIC", NULL, "Dmic" },
+};
+
 int asoc_sdw_senary_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
@@ -25,14 +29,21 @@ int asoc_sdw_senary_dmic_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_so
 
 	component = dai->component;
 
-	ret = snd_soc_dapm_add_routes(dapm, senary_dmic_map,
-				      ARRAY_SIZE(senary_dmic_map));
+	if (component->name_prefix) {
+		ret = snd_soc_dapm_add_routes(dapm, senary_dmic_map,
+					      ARRAY_SIZE(senary_dmic_map));
+		mic_name = devm_kstrdup(card->dev, component->name_prefix, GFP_KERNEL);
+	} else {
+		dev_warn(card->dev, "sn624x dmic: component %s has no name_prefix\n",
+			 component->name);
+		ret = snd_soc_dapm_add_routes(dapm, senary_dmic_map_bare,
+					      ARRAY_SIZE(senary_dmic_map_bare));
+		mic_name = devm_kstrdup(card->dev, "sn624x", GFP_KERNEL);
+	}
 	if (ret) {
 		dev_err(card->dev, "senary dmic map addition failed: %d\n", ret);
 		return ret;
 	}
-
-	mic_name = devm_kasprintf(card->dev, GFP_KERNEL, "%s", component->name_prefix);
 	if (!mic_name)
 		return -ENOMEM;
 
diff --git a/sound/soc/sdw_utils/soc_sdw_senary_sdca.c b/sound/soc/sdw_utils/soc_sdw_senary_sdca.c
index 5c2cd7530..0adde845a 100644
--- a/sound/soc/sdw_utils/soc_sdw_senary_sdca.c
+++ b/sound/soc/sdw_utils/soc_sdw_senary_sdca.c
@@ -18,6 +18,10 @@ static const struct snd_soc_dapm_route sn624x_spk_map[] = {
 	{ "Speaker", NULL, "sn624x SPK" },
 };
 
+static const struct snd_soc_dapm_route sn624x_spk_map_bare[] = {
+	{ "Speaker", NULL, "SPK" },
+};
+
 /* Structure to map codec names to respective route arrays and sizes */
 struct codec_route_map {
 	const char *codec_name;
@@ -45,16 +49,30 @@ int asoc_sdw_senary_sdca_spk_rtd_init(struct snd_soc_pcm_runtime *rtd, struct sn
 	struct snd_soc_dapm_context *dapm = snd_soc_card_to_dapm(card);
 	int ret;
 
-	/* Match by DAI name prefix (e.g. sn624x-sdca-aif2). */
 	const struct codec_route_map *route_map = get_codec_route_map(dai->name);
+	const struct snd_soc_dapm_route *routes;
+	size_t nroutes;
 
 	if (!route_map) {
 		dev_err(rtd->dev, "failed to get codec name and route map\n");
 		return -EINVAL;
 	}
 
-	/* Add routes */
-	ret = snd_soc_dapm_add_routes(dapm, route_map->route_map, route_map->route_size);
+	/*
+	 * No name_prefix means the codec widgets were created as "SPK",
+	 * not "sn624x SPK". DAI name is still sn624x-sdca-aif2.
+	 */
+	if (!dai->component->name_prefix) {
+		dev_warn(rtd->dev, "sn624x spk: component %s has no name_prefix\n",
+			 dai->component->name);
+		routes = sn624x_spk_map_bare;
+		nroutes = ARRAY_SIZE(sn624x_spk_map_bare);
+	} else {
+		routes = route_map->route_map;
+		nroutes = route_map->route_size;
+	}
+
+	ret = snd_soc_dapm_add_routes(dapm, routes, nroutes);
 	if (ret)
 		dev_err(rtd->dev, "failed to add rt sdca spk map: %d\n", ret);
 
diff --git a/sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c b/sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c
index 1dab6f998..c61c1f160 100644
--- a/sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c
+++ b/sound/soc/sdw_utils/soc_sdw_senary_sdca_jack_common.c
@@ -57,6 +57,12 @@ static const struct snd_soc_dapm_route senary_sdca_jack_map[] = {
 	{ "sn624x MIC2", NULL, "Headset Mic" },
 };
 
+/* Widget names stay bare when codec_conf did not apply a name_prefix. */
+static const struct snd_soc_dapm_route senary_sdca_jack_map_bare[] = {
+	{ "Headphone", NULL, "HP" },
+	{ "MIC2", NULL, "Headset Mic" },
+};
+
 static struct snd_soc_jack_pin senary_sdca_jack_pins[] = {
 	{
 		.pin    = "Headphone",
@@ -68,10 +74,6 @@ static struct snd_soc_jack_pin senary_sdca_jack_pins[] = {
 	},
 };
 
-static const char * const need_sdca_suffix[] = {
-	"sn624x"
-};
-
 int asoc_sdw_senary_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd, struct snd_soc_dai *dai)
 {
 	struct snd_soc_card *card = rtd->card;
@@ -79,38 +81,41 @@ int asoc_sdw_senary_sdca_jack_rtd_init(struct snd_soc_pcm_runtime *rtd, struct s
 	struct asoc_sdw_mc_private *ctx = snd_soc_card_get_drvdata(card);
 	struct snd_soc_component *component;
 	struct snd_soc_jack *jack;
+	const struct snd_soc_dapm_route *routes = senary_sdca_jack_map;
+	const char *prefix;
+	int nroutes = ARRAY_SIZE(senary_sdca_jack_map);
 	int ret;
-	int i;
 
 	component = dai->component;
+	prefix = component->name_prefix;
+	/*
+	 * codec_conf should set name_prefix to "sn624x" before DAPM widgets
+	 * are created. If that match fails, name_prefix is NULL: strstr()
+	 * oopses, and the widgets keep the bare names from the codec driver.
+	 */
+	if (!prefix) {
+		dev_warn(card->dev,
+			 "sn624x jack: component %s has no name_prefix\n",
+			 component->name);
+		prefix = "sn624x";
+		routes = senary_sdca_jack_map_bare;
+		nroutes = ARRAY_SIZE(senary_sdca_jack_map_bare);
+	} else if (!strstr(prefix, "sn624x")) {
+		dev_err(card->dev, "%s is not supported\n", prefix);
+		return -EINVAL;
+	}
+
 	card->components = devm_kasprintf(card->dev, GFP_KERNEL,
-					  "%s hs:%s",
-					  card->components, component->name_prefix);
+					  "%s hs:%s-sdca",
+					  card->components, prefix);
 	if (!card->components)
 		return -ENOMEM;
 
-	for (i = 0; i < ARRAY_SIZE(need_sdca_suffix); i++) {
-		if (!strstr(component->name_prefix, need_sdca_suffix[i]))
-			continue;
-
-		card->components = devm_kasprintf(card->dev, GFP_KERNEL,
-						  "%s-sdca", card->components);
-		if (!card->components)
-			return -ENOMEM;
-
-		ret = snd_soc_dapm_add_routes(dapm, senary_sdca_jack_map,
-					      ARRAY_SIZE(senary_sdca_jack_map));
-		if (ret) {
-			dev_err(card->dev,
-				"senary sdca jack map addition failed: %d\n", ret);
-			return ret;
-		}
-		break;
-	}
-
-	if (i == ARRAY_SIZE(need_sdca_suffix)) {
-		dev_err(card->dev, "%s is not supported\n", component->name_prefix);
-		return -EINVAL;
+	ret = snd_soc_dapm_add_routes(dapm, routes, nroutes);
+	if (ret) {
+		dev_err(card->dev, "senary sdca jack map addition failed: %d\n",
+			ret);
+		return ret;
 	}
 
 	ret = snd_soc_card_jack_new_pins(rtd->card, "Headset Jack",
