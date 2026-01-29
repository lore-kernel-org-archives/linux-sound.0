Received: from out-178.mta0.migadu.com (out-178.mta0.migadu.com [91.218.175.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0141A348440;
	Thu, 29 Jan 2026 17:23:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769707406; cv=none; b=GcNe/VKzwzLJicp8sqQG6C7UurShymeDBetiphi7FYLBwepzxfr8jeBkxDkrRt5mz5Lk6DTiI2BwawpLwGEvZVcYcFobyl2sYAHPEoVipQ83L4mRjwxI/2nLSlXP5X/w2FdbNKfTBjsCM11oKO05NMqiQy29Kh6MM/Mz5qAL06A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769707406; c=relaxed/simple;
	bh=vWIj2NJq9duOhBnWPBRdvtYwI3yI3O9kbYURqYvG95E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ngAKwF1pike2JR4fXrpj3W4hWXDQ7nZ4wIwxMStm4Vayg4RrHQ3g8D5S445LeCacuiM0cTSs0BATDFR2twVVDps72wImhe/NZoZD8us/FRN55hM+DkGiFVg2F5bChRU6H2Xv+r1FqyZKzEQgQwpnJ/JlCDq3ukoUA969vt1GyLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=j7N5KKVy; arc=none smtp.client-ip=91.218.175.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="j7N5KKVy"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1769707403;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=g+C1jrCk01uJW4tdXVNyjurMMFe30KQRlHA7Zs4K4+4=;
	b=j7N5KKVyRCU7RNDyNLydxDbfmCD1YYA/AVnpg4iShAxJy5loAN9PEySF3l/1szGsjOqUY9
	n08FRg9MdbIi3eFOvNiorSHUszKtoef6bHOzu8lkMafj8wucXUeYuWwgwZ33QOd7Dh3JRH
	X4EhOZVU4U08JtSUqY0ehQD0llGEf3w=
From: Sean Anderson <sean.anderson@linux.dev>
To: Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	linux-sound@vger.kernel.org
Cc: Jaroslav Kysela <perex@perex.cz>,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Michal Simek <michal.simek@amd.com>,
	Takashi Iwai <tiwai@suse.com>,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH 2/2] ASoC: xilinx: xlnx_i2s: Discover parameters from registers
Date: Thu, 29 Jan 2026 12:23:15 -0500
Message-Id: <20260129172315.3871602-3-sean.anderson@linux.dev>
In-Reply-To: <20260129172315.3871602-1-sean.anderson@linux.dev>
References: <20260129172315.3871602-1-sean.anderson@linux.dev>
Precedence: bulk
X-Mailing-List: linux-sound@vger.kernel.org
List-Id: <linux-sound.vger.kernel.org>
List-Subscribe: <mailto:linux-sound+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-sound+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Xilinx helpfully included a read-only "config" register that contains
configuration parameters. Discover our parameters from this register
instead of reading them from the device tree.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 sound/soc/xilinx/xlnx_i2s.c | 32 +++++++++++---------------------
 1 file changed, 11 insertions(+), 21 deletions(-)

diff --git a/sound/soc/xilinx/xlnx_i2s.c b/sound/soc/xilinx/xlnx_i2s.c
index ca915a001ad5..a2b426376676 100644
--- a/sound/soc/xilinx/xlnx_i2s.c
+++ b/sound/soc/xilinx/xlnx_i2s.c
@@ -17,6 +17,9 @@
 
 #define DRV_NAME "xlnx_i2s"
 
+#define I2S_CORE_CFG			0x04
+#define I2S_CORE_CFG_DATA_24BIT		BIT(16)
+#define I2S_CORE_CFG_CHANNELS		GENMASK(11, 8)
 #define I2S_CORE_CTRL_OFFSET		0x08
 #define I2S_CORE_CTRL_32BIT_LRCLK	BIT(3)
 #define I2S_CORE_CTRL_ENABLE		BIT(0)
@@ -172,7 +175,7 @@ static int xlnx_i2s_probe(struct platform_device *pdev)
 {
 	struct xlnx_i2s_drv_data *drv_data;
 	int ret;
-	u32 format;
+	u32 format, cfg;
 	struct device *dev = &pdev->dev;
 	struct device_node *node = dev->of_node;
 
@@ -184,27 +187,14 @@ static int xlnx_i2s_probe(struct platform_device *pdev)
 	if (IS_ERR(drv_data->base))
 		return PTR_ERR(drv_data->base);
 
-	ret = of_property_read_u32(node, "xlnx,num-channels", &drv_data->channels);
-	if (ret < 0) {
-		dev_err(dev, "cannot get supported channels\n");
-		return ret;
-	}
-	drv_data->channels *= 2;
-
-	ret = of_property_read_u32(node, "xlnx,dwidth", &drv_data->data_width);
-	if (ret < 0) {
-		dev_err(dev, "cannot get data width\n");
-		return ret;
-	}
-	switch (drv_data->data_width) {
-	case 16:
-		format = SNDRV_PCM_FMTBIT_S16_LE;
-		break;
-	case 24:
+	cfg = readl(drv_data->base + I2S_CORE_CFG);
+	drv_data->channels = FIELD_GET(I2S_CORE_CFG_CHANNELS, cfg);
+	if (cfg & I2S_CORE_CFG_DATA_24BIT) {
+		drv_data->data_width = 24;
 		format = SNDRV_PCM_FMTBIT_S24_LE;
-		break;
-	default:
-		return -EINVAL;
+	} else {
+		drv_data->data_width = 16;
+		format = SNDRV_PCM_FMTBIT_S16_LE;
 	}
 
 	if (of_device_is_compatible(node, "xlnx,i2s-transmitter-1.0")) {
-- 
2.35.1.1320.gc452695387.dirty

