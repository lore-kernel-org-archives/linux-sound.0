Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=8.221.36.76
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794879376;
	b=UQxiML0EDbhAG5X0kQY4gBqDqKoXHFbSOjpz6UHAgaLdB99ZeSo9Qmd6t/wDJ9x5J92f
	 n3mnNYQnVySV6zroIIuu8wD24FZXxZdY+OebqBZsbCMk6ie4Taq3NsqFpd4QkheZcki9x
	 +gUqu9Ath/FYu5ECMfBmGormpWp6PLSkk+J75s4bRqUf3AveMhA/SQt590pIvEmrvLN+n
	 Wr+38TKgGY1HkqlRSwF25hbEf7bxe/VSjdC/mHzHZ//dC+WNoA2R0PAFJPkbLmvXiBD3X
	 9I3rq3qYUjYXxV9rAsAtyuCafiQSDTj0uj0IvtvpnSmpYJk6QjEijwnXO9jReTiLu3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794879376;
	h=DMARC-Filter:Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 MIME-Version:Content-Transfer-Encoding:X-HM-Tid:X-HM-MType:
	 X-HM-Spam-Status:DKIM-Signature;
	bh=PFCiqsnkXhx9VEkHtX1gsY7SvYMDgHSFrr/cDGG5GxE=;
	b=WWvRIixy6oq0dr9026zUslnKwonbLnj5v1Xpd3L83evL0kwsxdlAGU/Doa4RS1b8MCQ7
	 5k9fncYbMfXUNEAKzUHJ6v5WGFoGni0H1ofRadpjkIcwmC1qxQ30tBxAEmlGwAAyFu/wh
	 ofmk9iTcWIVs8NeX3reo6Oz2yZ3P24G4WshS5tRPBU/D+CNSePgR5yLR6+bQM9OuEO14d
	 z7W27sUJTUCN0tAKJleBPlL984Z5NVxXkJVQfwpxOF36G2quzac438HlRw6sAlJ1wD7yb
	 xmVUmhPfCtFGvIaIuI/JHEM1Xvo81B3QgF4HcWXmXQyUZBNW7yTIQjbWfSRJAaBCOKw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=senarytech.com;
	spf=pass smtp.mailfrom=senarytech.com;
	dkim=pass header.d=senarytech.com header.i=@senarytech.com header.a=rsa-sha256 header.s=default header.b=OmDKHUEN;
	arc=none smtp.remote-ip=8.221.36.76
Received: from mail-m82213676.xmail.ntesmail.com (mail-m82213676.xmail.ntesmail.com [8.221.36.76])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC824606A31C
	for <linux-sound@vger.kernel.org>; Tue, 17 Nov 2026 01:36:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AC824606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=senarytech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=senarytech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=senarytech.com header.i=@senarytech.com header.a=rsa-sha256 header.s=default header.b=OmDKHUEN
Received: from Wangqianghua.localdomain (unknown [27.38.192.73])
	by smtp.qiye.163.com (Hmail) with ESMTP id 54e8c7cd4;
	Tue, 17 Nov 2026 09:36:00 +0800 (GMT+08:00)
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
	Qianghua Wang <qianghua.wang@senarytech.com>
Subject: [PATCH] ASoC: sn624x: honor ACPI DisCo when MIC SDCA function is absent
Date: Tue, 17 Nov 2026 09:35:57 +0800
Message-ID: <20261117013558.1790310-1-qianghua.wang@senarytech.com>
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
X-HM-Tid: 0aa1e7258cbc09d8kunm3b66b7b22c3818
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVkZHR1JVhhLGEpKQ01JGkoZHVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlJTFVIQ1VKQklVTEhZV1kWGg8SFR0UWUFZT0tIVUpLSU
	JDQ0xVSktLVUtZBg++
DKIM-Signature: a=rsa-sha256;
	b=OmDKHUENwCvahebsptHTj5jcoNzdvDDeUNBgiimgo+U/z/b1aIBcEH75C9gXN2vGhOAezRTK99m0v/VtnsTAT2fPZr4lWkF8A2netRvbyExLKjUFJUlkHchcPyXn5Itq70qhTtzOo9c3qAhG7Fuy0//OKLBfetnXa7QFrZQiDS4=; c=relaxed/relaxed; s=default; d=senarytech.com; v=1;
	bh=PFCiqsnkXhx9VEkHtX1gsY7SvYMDgHSFrr/cDGG5GxE=;
	h=date:mime-version:subject:message-id:from;

Some laptops ship ACPI _DSD DisCo for Senary SN624x with jack and
speaker amp SDCA functions only, omitting the MIC array function even
though the codec might otherwise expose a DMIC. The driver always
advertised the DMIC capture port and ran DMIC function init against
registers not described in DisCo, which breaks bring-up on platforms
that use a minimal function list (for example some Panther Lake
designs).

Look at the parsed DisCo function list before exposing the DMIC port
and before running DMIC init. Apply AMP function init from the ACPI
init tables when an amp function is present, using the same pattern as
the jack and DMIC paths.

Link: https://github.com/thesofproject/linux/issues/6012
Signed-off-by: Qianghua Wang <qianghua.wang@senarytech.com>
---
 sound/soc/codecs/sn624x-sdca-sdw.c | 96 ++++++++++++++++++++++++++++--
 1 file changed, 92 insertions(+), 4 deletions(-)

diff --git a/sound/soc/codecs/sn624x-sdca-sdw.c b/sound/soc/codecs/sn624x-sdca-sdw.c
index 1d4e5f27a..f201ff38c 100644
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
@@ -1055,6 +1058,43 @@ static int sn624x_dmic_apply_defaults(struct device *dev,
 	return sn624x_dmic_oem_fallback_init(dev, sn624x);
 }
 
+static bool sn624x_sdca_disco_has_mic(const struct sdw_slave *slave)
+{
+	int i;
+
+	if (!slave->sdca_data.interface_revision || !slave->sdca_data.num_functions)
+		return false;
+	for (i = 0; i < slave->sdca_data.num_functions; i++) {
+		const struct sdca_function_desc *desc = &slave->sdca_data.function[i];
+
+		if (desc->adr == SN624X_FUNC_NUM_MIC_ARRAY)
+			return true;
+		switch (desc->type) {
+		case SDCA_FUNCTION_TYPE_SMART_MIC:
+		case SDCA_FUNCTION_TYPE_SIMPLE_MIC:
+			return true;
+		default:
+			break;
+		}
+	}
+	return false;
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
+		return -ENOENT;
+	ret = sn624x_write_sdca_init_table(dev, sn624x, sn624x->amp_func, "amp");
+	if (ret == 0)
+		usleep_range(1000, 1500);
+	return ret;
+}
+
 static int sn624x_sdca_jack_function_init(struct device *dev,
 					  struct sn624x_sdca_priv *sn624x)
 {
@@ -1088,11 +1128,18 @@ static int sn624x_sdca_jack_function_init(struct device *dev,
 static int sn624x_sdca_dmic_function_init(struct device *dev,
 					  struct sn624x_sdca_priv *sn624x)
 {
+	struct sdw_slave *slave = sn624x->slave;
 	unsigned int dmic_func_status;
 	const struct reg_sequence clear_status =
 		REG_SEQ0(SN624X_REG_DMIC_FUN_STATUS_CTL, 0x61);
 	int ret;
 
+	if (!sn624x_sdca_disco_has_mic(slave)) {
+		dev_dbg(dev,
+			"sn624x: no MIC SDCA function in ACPI DisCo, skip DMIC init\n");
+		return 0;
+	}
+
 	ret = regmap_read_bypassed(sn624x->regmap,
 				   SN624X_REG_DMIC_FUN_STATUS_CTL,
 				   &dmic_func_status);
@@ -1104,6 +1151,40 @@ static int sn624x_sdca_dmic_function_init(struct device *dev,
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
+		if (!sn624x->first_hw_init && sn624x->amp_func->num_init_table)
+			dev_dbg(dev,
+				"sn624x: amp FUN STATUS 0x%x, apply ACPI init table anyway\n",
+				amp_func_status);
+		else
+			return 0;
+	}
+	ret = sn624x_amp_apply_defaults(dev, sn624x);
 	if (ret < 0)
 		return ret;
 
@@ -1161,6 +1242,11 @@ static int sn624x_sdca_io_init(struct device *dev, struct sdw_slave *slave)
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
@@ -1253,8 +1339,9 @@ static int sn624x_sdca_read_prop(struct sdw_slave *slave)
 	prop->use_domain_irq = true;
 	prop->wake_capable = true;
 
-	prop->source_ports = BIT(SN624X_PORT_JACK_CAPTURE) |
-			     BIT(SN624X_PORT_DMIC_CAPTURE);
+	prop->source_ports = BIT(SN624X_PORT_JACK_CAPTURE);
+	if (sn624x_sdca_disco_has_mic(slave))
+		prop->source_ports |= BIT(SN624X_PORT_DMIC_CAPTURE);
 	prop->sink_ports = BIT(SN624X_PORT_JACK_PLAYBACK) |
 			   BIT(SN624X_PORT_SPEAKER_PLAYBACK);
 
@@ -1292,8 +1379,9 @@ static int sn624x_sdca_read_prop(struct sdw_slave *slave)
 	prop->simple_clk_stop_capable = true;
 	prop->lane_control_support = true;
 	SN624X_DBG(&slave->dev,
-		   "read_prop: src_ports=0x%x sink_ports=0x%x lane irq paging\n",
-		   prop->source_ports, prop->sink_ports);
+		   "read_prop: src_ports=0x%x sink_ports=0x%x mic_disco=%d lane irq paging\n",
+		   prop->source_ports, prop->sink_ports,
+		   sn624x_sdca_disco_has_mic(slave));
 
 	return 0;
 }
-- 
2.43.0

