Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=47.88.81.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794895349;
	b=3Y0okv4ooc7XyrD15PhkDoFkrsGtbCdXNA2wfRn6HADT30Qi3GtFcE84Mnz5FPlu9ajh
	 kmrTFR6V38ARtmIn07/rWEwluhMu7oBA4I1NKJ/BIapCkcVd8vXDEkU3jZpwqZn09dgLm
	 +YJyq5Yi1+Kkntk8UGW2or+RfUwaixj7O50aEdkGB5BV9WmwPQh9neu0WkJENgjy436F0
	 OyoNS63rhcKPnuDJMjwFTnFpfqgfmZXrm4zJlhhWpN/HTM/m2lOSA7Cvwt47GZ8qd5z0M
	 ub7UCGwM4tOLrMEZuFZfQmpSHNK2OYj2lnISF9Bfs+XhiBVueB8OgugYOfZwIfIL6aw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794895349;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding:
	 X-HM-Tid:X-HM-MType:X-HM-Spam-Status:DKIM-Signature;
	bh=BqzBSFumBjSfiT9hVXC0RGNN2q1qnjABaIknP0p+59E=;
	b=g1icq2aoxFPsXB9qvjwPHyBHRP7cNNCj0fFkc1umZGnywbBWbSQppZYGVrSHNSNRZ1wU
	 hSqlELwkR8bMc4qiqm0WuPSOf9W0/W/hKN940Xo/c+NofzpPH9tKpeQCQK80EC7X3nfMl
	 NqDCiDHn6rDbifAme8+RIc35aKM+xaRTAODGZ8w57AVjBdxamiT3QIcmTx9x5US7MQ+e2
	 /KDpLZIeBP1v+gOIgX+F1hn/hD03kBJTilXY5K6vkvG8Auj+wbTMtV+0pFKFWxwpPlOSZ
	 yywBLM5SsJ0G4oGzLQL1KeLXemvN0noetJ97Qta74LI2RhyBIvhWrseGd5616oPKjdw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=senarytech.com;
	spf=pass smtp.mailfrom=senarytech.com;
	dkim=pass header.d=senarytech.com header.i=@senarytech.com header.a=rsa-sha256 header.s=default header.b=SQ+j4O4K;
	arc=none smtp.remote-ip=47.88.81.175
Received: from mail-m81175.netease.com (mail-m81175.netease.com [47.88.81.175])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 551D2606A31C
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 06:02:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 551D2606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=senarytech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=senarytech.com header.i=@senarytech.com header.a=rsa-sha256 header.s=default header.b=SQ+j4O4K
Received: from Wangqianghua.localdomain (unknown [27.38.192.73])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54f1dac19;
	Tue, 17 Nov 2026 14:02:15 +0800 (GMT+08:00)
From: Qianghua Wang <qianghua.wang@senarytech.com>
To: linux-sound@vger.kernel.org
Cc: broonie@kernel.org,
	lgirdwood@gmail.com,
	bo.liu@senarytech.com
Subject: [PATCH v3] ASoC: sn624x: skip DMIC when ACPI DisCo has no MIC function
Date: Tue, 17 Nov 2026 14:02:13 +0800
Message-ID: <20261117060213.2327503-1-qianghua.wang@senarytech.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261117013558.1790310-1-qianghua.wang@senarytech.com>
References: <20261117013558.1790310-1-qianghua.wang@senarytech.com>
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
X-HM-Tid: 0aa1e8194dfb09d8kunm5a9821072ec259
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDSkIYVk5MThpJQkNDGE1CHVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlJTFVIQ1VKQklVTEhZV1kWGg8SFR0UWUFZT0tIVUpLSU
	JDQ0xVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=SQ+j4O4KFVHvxlp11SoL8OujduXsDULkoldRCBCaJ2LF2UhlPCQvs4KfnJzIbgsb6EdsHJR3bOhrZOgnUqP5Bqtf27i0TXGI34p1jb01DpZ1mCVQuKlylZCrCdfV9d2GKKZj5aKc1IQWzipciihIAbGdaMNcU7AbggMoGl8F66M=; c=relaxed/relaxed; s=default; d=senarytech.com; v=1;
	bh=BqzBSFumBjSfiT9hVXC0RGNN2q1qnjABaIknP0p+59E=;
	h=date:mime-version:subject:message-id:from;

Some OEM platforms, such as certain Samsung designs, use Senary SN624x
for headset jack and speaker playback only: ACPI _DSD DisCo describes
jack and speaker amp SDCA functions but omits the MIC array function
because no on-board DMIC is routed to the codec. The driver still
advertised the DMIC capture port and ran DMIC function init against
registers that DisCo does not expose, which breaks bring-up on these
machines.

Probe the parsed DisCo function list before exposing the DMIC port and
before running DMIC init. Apply AMP function init from the ACPI init
tables when an amp function is present, using the same pattern as the
existing jack and DMIC paths.

Only omit DMIC when DisCo is present but lists no MIC function, so
platforms without DisCo still use the OEM DMIC fallback. Do not fail amp
init when there is no ACPI init table. Re-apply amp init tables after
re-attach when FUN STATUS is idle but DisCo still supplies a table.

Fixes: 12d9c9f8679c ("ASoC: codecs: add SN624x SDCA SoundWire driver")
Signed-off-by: Qianghua Wang <qianghua.wang@senarytech.com>
---
Changes in v3:
- Add commit subject to Fixes: trailer (Sashiko review).

Changes in v2:
- Address Sashiko review (amp -ENOENT, DisCo vs no-DisCo DMIC, re-attach amp).

 sound/soc/codecs/sn624x-sdca-sdw.c | 101 +++++++++++++++++++++++++++--
 1 file changed, 97 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/sn624x-sdca-sdw.c b/sound/soc/codecs/sn624x-sdca-sdw.c
index 1d4e5f27a..8959b447f 100644
--- a/sound/soc/codecs/sn624x-sdca-sdw.c
+++ b/sound/soc/codecs/sn624x-sdca-sdw.c
@@ -176,6 +176,9 @@ static int sn624x_uaj_ge35_apply_detected_mode(struct device *dev,
 	SDW_SDCA_CTL(SN624X_FUNC_NUM_MIC_ARRAY, SN624X_SDCA_ENT_ENTITY0, \
 		     SN624X_SDCA_CTL_FUNCTION_STATUS, 0)
 
+#define SN624X_REG_AMP_FUN_STATUS_CTL \
+	SDW_SDCA_CTL(SN624X_FUNC_NUM_SPEAKER_AMP, SN624X_SDCA_ENT_ENTITY0, \
+		     SN624X_SDCA_CTL_FUNCTION_STATUS, 0)
 /*
  * Write REQUESTED_PS then poll ACTUAL_PS with the shared SDCA helper
  * (sdca_asoc_pde_poll_actual_ps). Caller must not hand-roll ACTUAL_PS waits.
@@ -1055,6 +1058,49 @@ static int sn624x_dmic_apply_defaults(struct device *dev,
 	return sn624x_dmic_oem_fallback_init(dev, sn624x);
 }
 
+/*
+ * Return true only when ACPI DisCo is present and lists no MIC function.
+ * Without DisCo, return false so the legacy OEM fallback path still runs.
+ */
+static bool sn624x_sdca_disco_omits_mic(const struct sdw_slave *slave)
+{
+	int i;
+
+	if (!slave->sdca_data.interface_revision || !slave->sdca_data.num_functions)
+		return false;
+	for (i = 0; i < slave->sdca_data.num_functions; i++) {
+		const struct sdca_function_desc *desc = &slave->sdca_data.function[i];
+
+		if (desc->adr == SN624X_FUNC_NUM_MIC_ARRAY)
+			return false;
+		switch (desc->type) {
+		case SDCA_FUNCTION_TYPE_SMART_MIC:
+		case SDCA_FUNCTION_TYPE_SIMPLE_MIC:
+			return false;
+		default:
+			break;
+		}
+	}
+	return true;
+}
+
+static int sn624x_amp_apply_defaults(struct device *dev,
+				     struct sn624x_sdca_priv *sn624x)
+{
+	int ret;
+
+	if (!sn624x || !sn624x->regmap || !sn624x->slave)
+		return -ENODEV;
+	if (!sn624x->amp_func)
+		return 0;
+	ret = sn624x_write_sdca_init_table(dev, sn624x, sn624x->amp_func, "amp");
+	if (ret == -ENOENT)
+		return 0;
+	if (ret == 0)
+		usleep_range(1000, 1500);
+	return ret;
+}
+
 static int sn624x_sdca_jack_function_init(struct device *dev,
 					  struct sn624x_sdca_priv *sn624x)
 {
@@ -1088,11 +1134,18 @@ static int sn624x_sdca_jack_function_init(struct device *dev,
 static int sn624x_sdca_dmic_function_init(struct device *dev,
 					  struct sn624x_sdca_priv *sn624x)
 {
+	struct sdw_slave *slave = sn624x->slave;
 	unsigned int dmic_func_status;
 	const struct reg_sequence clear_status =
 		REG_SEQ0(SN624X_REG_DMIC_FUN_STATUS_CTL, 0x61);
 	int ret;
 
+	if (sn624x_sdca_disco_omits_mic(slave)) {
+		dev_dbg(dev,
+			"sn624x: ACPI DisCo has no MIC function, skip DMIC init\n");
+		return 0;
+	}
+
 	ret = regmap_read_bypassed(sn624x->regmap,
 				   SN624X_REG_DMIC_FUN_STATUS_CTL,
 				   &dmic_func_status);
@@ -1104,6 +1157,39 @@ static int sn624x_sdca_dmic_function_init(struct device *dev,
 		return 0;
 
 	ret = sn624x_dmic_apply_defaults(dev, sn624x);
+	if (ret < 0)
+		return ret;
+	ret = regmap_multi_reg_write_bypassed(sn624x->regmap, &clear_status, 1);
+	if (ret < 0)
+		return ret;
+	usleep_range(1000, 1500);
+	return 0;
+}
+
+static int sn624x_sdca_amp_function_init(struct device *dev,
+					 struct sn624x_sdca_priv *sn624x)
+{
+	unsigned int amp_func_status;
+	const struct reg_sequence clear_status =
+		REG_SEQ0(SN624X_REG_AMP_FUN_STATUS_CTL, 0x61);
+	int ret;
+
+	if (!sn624x->amp_func)
+		return 0;
+	ret = regmap_read_bypassed(sn624x->regmap,
+				   SN624X_REG_AMP_FUN_STATUS_CTL,
+				   &amp_func_status);
+	if (ret < 0)
+		return ret;
+	if (!(amp_func_status & (SN624X_JACK_FUN_NEEDS_INIT |
+				 SN624X_JACK_FUN_HAS_BEEN_RESET))) {
+		if (!sn624x->amp_func->num_init_table)
+			return 0;
+		dev_dbg(dev,
+			"sn624x: amp FUN STATUS 0x%x, apply ACPI init table\n",
+			amp_func_status);
+	}
+	ret = sn624x_amp_apply_defaults(dev, sn624x);
 	if (ret < 0)
 		return ret;
 
@@ -1161,6 +1247,11 @@ static int sn624x_sdca_io_init(struct device *dev, struct sdw_slave *slave)
 		dev_err(dev, "sn624x: jack function init failed (%d)\n", ret);
 		goto err;
 	}
+	ret = sn624x_sdca_amp_function_init(dev, sn624x);
+	if (ret < 0) {
+		dev_err(dev, "sn624x: amp function init failed (%d)\n", ret);
+		goto err;
+	}
 
 	ret = sn624x_sdca_dmic_function_init(dev, sn624x);
 	if (ret < 0) {
@@ -1253,8 +1344,9 @@ static int sn624x_sdca_read_prop(struct sdw_slave *slave)
 	prop->use_domain_irq = true;
 	prop->wake_capable = true;
 
-	prop->source_ports = BIT(SN624X_PORT_JACK_CAPTURE) |
-			     BIT(SN624X_PORT_DMIC_CAPTURE);
+	prop->source_ports = BIT(SN624X_PORT_JACK_CAPTURE);
+	if (!sn624x_sdca_disco_omits_mic(slave))
+		prop->source_ports |= BIT(SN624X_PORT_DMIC_CAPTURE);
 	prop->sink_ports = BIT(SN624X_PORT_JACK_PLAYBACK) |
 			   BIT(SN624X_PORT_SPEAKER_PLAYBACK);
 
@@ -1292,8 +1384,9 @@ static int sn624x_sdca_read_prop(struct sdw_slave *slave)
 	prop->simple_clk_stop_capable = true;
 	prop->lane_control_support = true;
 	SN624X_DBG(&slave->dev,
-		   "read_prop: src_ports=0x%x sink_ports=0x%x lane irq paging\n",
-		   prop->source_ports, prop->sink_ports);
+		   "read_prop: src_ports=0x%x sink_ports=0x%x disco_omits_mic=%d lane irq paging\n",
+		   prop->source_ports, prop->sink_ports,
+		   sn624x_sdca_disco_omits_mic(slave));
 
 	return 0;
 }
-- 
2.43.0

