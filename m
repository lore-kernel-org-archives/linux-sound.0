Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.209.128.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794966858;
	b=NGktMu9tXWo6+bBvoV/SyjBXi7hdEUm1JuAasvMJEo0ZHxDBPlsGt651jfyMQYlDO3gV
	 ve8+A9jtdyLxYybCOE7M/us/JlNa5LUh5xO1oO98kPEvfaQhMS7Ud7epLXT/Gid43EVRM
	 9rDIboMIbQ3nFcyFR9IF9PGOOWP3IDKmIKQ9Ruh52VVtKLFooPsFNM7gpw6MlhKS9St6b
	 50kFYGchDGmtlLDqTcPFIvuVPFz2201ivzR6MzJoUvo1GoHa+eANy2BuGKUa41ZXLFu+y
	 fvfGO7lJabRQH7Nq7EeL/KuR+WGNzNH0kDp6rgz6RXlBGyLNdEzboEZpuvtj5XE4knA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794966858;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=BqzBSFumBjSfiT9hVXC0RGNN2q1qnjABaIknP0p+59E=;
	b=PKsHDpO16KzHSmAp/p/YQtBVekgsESp7izI5V6ZU346cfyV/0L56WvPJdMQw/XvjwiFi
	 RuDAvopQhL0VJXs/KO+qXLtdtbSNh/NRu5Nsq1hBW348kNfyRBY1lHU0Tft1ksNXgHy+h
	 C0HlsrGyohD4AwcHefG32wcKUSv7W6bbq/uYrKF87IE569/zaBQpThUIv5EZLTl7W8rLy
	 YKxwMFUWZoWdJHPbMKWUy5n4y5bxen5MGa5LlYV0J6BmaZ1AS5R5e5RIV51+3ekfDoHhb
	 tgQiWqxgOghP9NP5krbum3da3RufvUSL9cn6DuW3M0hchWLgHKBtYdxH2atbOjAvPjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=senarytech.com;
	spf=pass smtp.mailfrom=senarytech.com;
	dkim=pass header.d=senarytech.com header.i=@senarytech.com header.a=rsa-sha256 header.s=default header.b=dV2CHGPN;
	arc=none smtp.remote-ip=103.209.128.72
Received: from mail-m12872.netease.com (mail-m12872.netease.com [103.209.128.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CC9C606A31C
	for <linux-sound@vger.kernel.org>; Wed, 18 Nov 2026 01:54:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6CC9C606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=senarytech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=senarytech.com header.i=@senarytech.com header.a=rsa-sha256 header.s=default header.b=dV2CHGPN
Received: from Wangqianghua.localdomain (unknown [222.211.124.158])
	by smtp.qiye.163.com (Hmail) with ESMTP id 550f03ed8;
	Wed, 18 Nov 2026 09:54:05 +0800 (GMT+08:00)
From: Qianghua Wang <qianghua.wang@senarytech.com>
To: linux-sound@vger.kernel.org
Cc: broonie@kernel.org,
	lgirdwood@gmail.com,
	bo.liu@senarytech.com,
	Qianghua Wang <qianghua.wang@senarytech.com>
Subject: [PATCH v3] ASoC: sn624x: skip DMIC when ACPI DisCo has no MIC function
Date: Wed, 18 Nov 2026 09:54:05 +0800
Message-ID: <20261118015405.642753-1-qianghua.wang@senarytech.com>
X-Mailer: git-send-email 2.43.0
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
X-HM-Tid: 0aa1ec5c78de09d8kunm2136f3ce379652
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDT0gfVkJNQ01MHU9IH01LH1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUlVSUpKVUpJT1VKTkNZV1kWGg8SFR0UWUFZT0tIVU
	pLSU9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=dV2CHGPNSNR0G5nSXxYfoigbtKfv6Vh3wU563yMHmLrg5cmgPXXhRNLgFvPjIH4fAVGyBmpm0Poql/cly2jKAeVlFHppSg+mFD1twJLmGhv1Y4zXywu+sAmBeJcUqtJKYCoDXh/giwrmOBxhH8siwO4SfCAIh2TQq7P7vl9f3fc=; c=relaxed/relaxed; s=default; d=senarytech.com; v=1;
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

