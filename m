Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.140
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792515894;
	b=g56jUqIalSz0g3gnafihjJBKfUdKiYqueXW4SqZoFCKAsKjAi0F0myryaFHANdpMWfga
	 NTioR5E6h9tMItnzVS6TsV/iYxQ1fXO1rpYefj6saDjy3dac6Kw4ylocdGL6D3Y3vQsA/
	 0rdVXXaqR16bj2xQYyt3X4tzp2G2xGN4ghp5eV59MJXFZJalSOiDCqQ/wEAojHCqxe/RB
	 NY8YoeD65DOd2itcEUh1Z9Gx7nLzTaqhyD15EAiMuGZLCPethZRsRN0LwWJsjrfVjihrF
	 gwKPecxHc+ePJJ4P9/fh3mYIh+ZG4tXKqk+0DUTL22b72WfTMy2jekHyJUY3qWlXfQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792515894;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=g6BHAtXDtqS3qwymeQ1ylIwxTTGg3fcGGSyK8Ln5I4g=;
	b=HGdiu/prjl1eg+teqCZx88MOQvaDwtNMZCqCtf/OLKHNTiq6xIkrDCyYsPuZRDm8aoWy
	 fdYr4iEJALfSoU7hk/ecSURUrwKKZ4bBMblfhoxsAaMZ0K31atNiv0iKQ8qnRY1Md9qbd
	 Q4rz3aGAHrop1r5Y6OreYz73XDPiPmLxFpevGtS3ILKgzmnZdv3DjiaxWtRlNezbSKt5Z
	 8tbn7/zsNa34nyrt/9P+Y5X++ZccjBv3p5loxcUm/reqbJJ9DbdwLiUwImJOr160xctUZ
	 LHp+PqwpgDi9y7PhFyqLV5FQmJsOGhcQ1OpYWZVNMCrzuja6H2PQWDjoypp3C0PRDKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=packett.cool;
	spf=pass smtp.mailfrom=packett.cool;
	dkim=pass header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=wD5hn0Vu;
	arc=none smtp.remote-ip=95.215.58.140
Received: from mta1.migadu.com (out-140.mta1.migadu.com [95.215.58.140])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06875606A31B
	for <linux-sound@vger.kernel.org>; Tue, 20 Oct 2026 17:04:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06875606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=packett.cool
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=packett.cool
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=packett.cool header.i=@packett.cool header.a=rsa-sha256 header.s=key1 header.b=wD5hn0Vu
X-Envelope-To: linux-sound@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=8p+QRqsqhWdNRDD7c+z0AwDj4JxdBoUKJNtnFvxOOAE=;
 c=simple/simple; d=packett.cool;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1792515891; v=1; x=1793120691;
 b=wD5hn0VuDCl+RlTly7BUc27UAOrwe1XKl7UWVEu7JE/PYUuLhyaaxklyflwPvp+1fP/+f+o9
 Gb/hNQppfZjG6vUNQM6aRH5u6F4LRDYYbjcgxxeRpMhElpvnfvj9EN2IG2TH2wGqZ1ZD0qn9xE8
 DK/TL1ZcWwVSBWh44mi+RrLr8nXKGzFNmobaCVx+KZfTFcLoZTSc9MIms4TJOU2w1faCPdscPEu
 l1lMTQ7BQpeGqectwWculPfQAgDDZqRV3BTvUgCSJbxvVvZBB8uKaAcvN320HD/5l98FZwTyaHF
 uuGkdTCAYG1/caVaL1vVxhte7j2IjmxO+gmoo+9D2rl6Q==
X-Envelope-To: linux-sound@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id d9d4934bb3e1d275;
	Tue, 20 Oct 2026 17:04:51 +0000
X-Mizu-Trace-ID: d9d4934bb3e1d275
X-Migadu-Flow: FLOW_OUT
From: Val Packett <val@packett.cool>
To: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Neil Armstrong <neil.armstrong@linaro.org>
Cc: Val Packett <val@packett.cool>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	~postmarketos/upstreaming@lists.sr.ht,
	phone-devel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: [PATCH v3 4/4] ASoC: codecs: wcd939x: fix ref leak and NULL deref with USB-C audio
Date: Tue, 20 Oct 2026 14:03:28 -0300
Message-ID: <20261020170341.1641325-5-val@packett.cool>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261020170341.1641325-1-val@packett.cool>
References: <20261020170341.1641325-1-val@packett.cool>
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

Some code issues were found during review of a port of typec code from
wcd939x to wcd937x, pointed out by sashiko-bot:

* wcd939x->wcd_mbhc may be accessed by the typec callbacks which are
  independent of the ASoC codec lifecycle, don't leave it as NULL/PTR_ERR;
* wcd939x->typec_switch reference was leaked on unbind, put it there;
* the device_node reference returned by of_graph_get_remote_node() was
  leaked, add a __free annotation to the declaration.

Fix them in wcd939x as well.

Cc: stable@vger.kernel.org
Fixes: 10f514bd172a ("ASoC: codecs: Add WCD939x Codec driver")
Signed-off-by: Val Packett <val@packett.cool>
---
 sound/soc/codecs/wcd939x.c | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wcd939x.c b/sound/soc/codecs/wcd939x.c
index 2d463f062e6d..b0b09468f98a 100644
--- a/sound/soc/codecs/wcd939x.c
+++ b/sound/soc/codecs/wcd939x.c
@@ -2470,6 +2470,7 @@ static int wcd939x_mbhc_init(struct snd_soc_component *component)
 {
 	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
 	struct wcd_mbhc_intr *intr_ids = &wcd939x->intr_ids;
+	struct wcd_mbhc *mbhc;
 
 	intr_ids->mbhc_sw_intr = regmap_irq_get_virq(wcd939x->irq_chip,
 						     WCD939X_IRQ_MBHC_SW_DET);
@@ -2486,9 +2487,12 @@ static int wcd939x_mbhc_init(struct snd_soc_component *component)
 	intr_ids->hph_right_ocp = regmap_irq_get_virq(wcd939x->irq_chip,
 						      WCD939X_IRQ_HPHR_OCP_INT);
 
-	wcd939x->wcd_mbhc = wcd_mbhc_init(component, &mbhc_cb, intr_ids, wcd_mbhc_fields, true);
-	if (IS_ERR(wcd939x->wcd_mbhc))
-		return PTR_ERR(wcd939x->wcd_mbhc);
+	mbhc = wcd_mbhc_init(component, &mbhc_cb, intr_ids, wcd_mbhc_fields, true);
+	if (IS_ERR(mbhc))
+		return PTR_ERR(mbhc);
+
+	/* May be accessed by platform dev typec callbacks, only set if valid */
+	wcd939x->wcd_mbhc = mbhc;
 
 	snd_soc_add_component_controls(component, impedance_detect_controls,
 				       ARRAY_SIZE(impedance_detect_controls));
@@ -2501,8 +2505,11 @@ static int wcd939x_mbhc_init(struct snd_soc_component *component)
 static void wcd939x_mbhc_deinit(struct snd_soc_component *component)
 {
 	struct wcd939x_priv *wcd939x = snd_soc_component_get_drvdata(component);
+	struct wcd_mbhc *mbhc = wcd939x->wcd_mbhc;
 
-	wcd_mbhc_deinit(wcd939x->wcd_mbhc);
+	/* May be accessed by platform dev typec callbacks, clear it first */
+	wcd939x->wcd_mbhc = NULL;
+	wcd_mbhc_deinit(mbhc);
 }
 
 /* END MBHC */
@@ -3175,7 +3182,7 @@ static int wcd939x_populate_dt_data(struct wcd939x_priv *wcd939x, struct device
 {
 	struct wcd_mbhc_config *cfg = &wcd939x->mbhc_cfg;
 #if IS_ENABLED(CONFIG_TYPEC)
-	struct device_node *np;
+	struct device_node *np __free(device_node) = NULL;
 #endif /* CONFIG_TYPEC */
 	int ret;
 
@@ -3438,6 +3445,10 @@ static void wcd939x_unbind(struct device *dev)
 	put_device(wcd939x->txdev);
 	put_device(wcd939x->rxdev);
 	component_unbind_all(dev, wcd939x);
+#if IS_ENABLED(CONFIG_TYPEC)
+	if (wcd939x->typec_analog_mux)
+		typec_switch_put(wcd939x->typec_switch);
+#endif /* CONFIG_TYPEC */
 }
 
 static const struct component_master_ops wcd939x_comp_ops = {
-- 
2.55.0

